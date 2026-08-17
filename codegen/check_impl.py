#!/usr/bin/env python3
"""proto 声明的 rpc 是否都有后端实现。

为什么需要:Go 的 `Unimplemented<Svc>Server` 会给每个方法兜底,所以
**proto 改了方法名而 handler 没跟,编译期一声不吭**,服务注册着、方法接不上,
运行时静默返 Unimplemented。真踩过三次:
  hi.club.Assets.Get      ← handler 还叫 GetUserAssets(proto 去 stutter 后没跟)
  hi.club.Price.Get       ← handler 还叫 GetPrice
  hi.club.User.ListOnline ← handler 还叫 ListOnlineUsers

⚠️ **一个 proto 包不等于一个仓**:hi.club.* 由 backend-hi-club 与 backend-hi-club-trade
   共同实现,hi.club.Agent.GetDefaultConfig 甚至落在 backend-hi-ai。所以要在**一组**仓里找,
   任一仓找到即算实现 —— 我第一版就是按"一包一仓"扫的,报了 6 个假阳性,
   差点让人删掉三个仓里正在跑的接口。

用法:check_impl.py [仓根目录] [--warn]   仓根目录默认 /home/lo/wip

⚠️ **在 proto 的 CI 里必须用 --warn(只报不拦)**:正常工作流是"先改 proto、再跟后端",
   proto 一 push 就跑 CI,那时后端还没跟,硬失败会把每次改名的第一次推送都卡死。
   它的价值是**把漂移显式喊出来**,而不是替人拦门。
"""
import re, sys, glob, os

args = [a for a in sys.argv[1:] if not a.startswith('--')]
WARN_ONLY = '--warn' in sys.argv
ROOT = args[0] if args else '/home/lo/wip'
os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# proto 包 → 可能实现它的仓(任一命中即可)
REPOS = {
    'hi.did':    ['backend-hi-did'],
    'hi.club':   ['backend-hi-club', 'backend-hi-club-trade', 'backend-hi-ai'],
    'hi.ai':     ['backend-hi-ai', 'backend-hi-ai-plugin'],
    # ⚠️ **包名是精确匹配的,`hi.ai` 不覆盖 `hi.ai.plugin`。** 少了这一行,
    #    hi/ai/plugin/base.proto 整个文件在上面 `pkg not in REPOS` 处被跳过 ——
    #    Runner(执行任意脚本)和 Builder(交叉编译任意 rust)这两个内部面
    #    **从来没被检查过**,而它们恰恰是最不该静默返 Unimplemented 的:
    #    一个卡住所有插件调用,一个卡住所有 NATIVE 发版,且都不会报错、只是不干活。
    'hi.ai.plugin': ['backend-hi-ai-plugin'],
    'hi.source': ['backend-hi-source'],
}
# 由**三方**实现的回调契约:平台反向调用,本方不实现是对的
THIRD_PARTY = {('hi.did', 'LoginCallback'), ('hi.did', 'PayCallback')}

src_cache = {}
def repo_src(repo):
    if repo not in src_cache:
        buf = []
        for f in glob.glob(f'{ROOT}/{repo}/**/*.go', recursive=True):
            if f.endswith('_test.go'):
                continue
            try:
                buf.append(open(f, encoding='utf-8', errors='ignore').read())
            except OSError:
                pass
        src_cache[repo] = '\n'.join(buf)
    return src_cache[repo]

missing, total = [], 0
for f in sorted(glob.glob('hi/**/*.proto', recursive=True)):
    src = open(f, encoding='utf-8').read()
    pkg = re.search(r'^package\s+([\w.]+);', src, re.M).group(1)
    if pkg not in REPOS:
        continue
    for sm in re.finditer(r'^service (\w+) \{(.*?)^\}', src, re.S | re.M):
        svc = sm.group(1)
        if (pkg, svc) in THIRD_PARTY:
            continue
        for rm in re.finditer(r'rpc\s+(\w+)\s*\(', sm.group(2)):
            meth = rm.group(1)
            total += 1
            # receiver 类型名以 service 名开头、以 Server 结尾(允许中间有词,如 XxxApiServer)
            pat = re.compile(r'func \(\w+ \*' + svc + r'\w*Server\) ' + meth + r'\(')
            if not any(pat.search(repo_src(r)) for r in REPOS[pkg]):
                missing.append(f'{f}: {pkg}.{svc}.{meth} —— 在 {"/".join(REPOS[pkg])} 中找不到实现'
                               f'(注册了 service 的话,运行时会静默返 Unimplemented)')

print(f'[check_impl] 共 {total} 个 rpc')
if missing:
    print(f'[check_impl] ❌ {len(missing)} 个未实现:')
    for m in missing:
        print('    ' + m)
    if not WARN_ONLY:
        sys.exit(1)
    print('[check_impl] (--warn:只报不拦。若这是"proto 先行、后端待跟",属预期;'
          '若改完后端仍在报,那就是真漂移了)')
else:
    print('[check_impl] ✓ 所有 rpc 均能找到后端实现')

# ── http 暴露面漂移(强化 pass)────────────────────────────────────────────
# 上面那个"包内任一仓实现即算通过"有个盲区:同一 service 被多仓注册时,只要
# **某个**仓实现了就放行 —— 而真正挂在 http 网关后面的那个仓可能名字漂了。
#   真踩过(同一天连中三个):hi.club.Trade.Get / Order.ListNotPulled /
#   Agent.GetDefaultConfig —— club(网关转发方)handler 还叫 GetTrade /
#   GetNotPulledPcOrders / DefaultConfig(旧名),而 club-trade/ai 里有正确名字的实现,
#   于是弱检查被骗过,web 一调 http 却 "method X not implemented"。
# 判据收紧:**谁注册了 http 网关(Register<Svc>HandlerFromEndpoint),谁就是 404 的
# 暴露面,必须自己实现该 service 的所有 http 路由方法**(方法名精确匹配 grpc rpc 名)。
# club-trade 只注册 grpc、不注册 http 网关,故它 Base 只实现 ServerVersion 不会误报。
ALIAS = {'hiclub': 'hi.club', 'hidid': 'hi.did', 'hiai': 'hi.ai',
         'source': 'hi.source', 'hisource': 'hi.source'}
# 有 http 路由的 (pkg.svc) → {method}
routed = {}
for y in glob.glob('http/*.yaml'):
    for sel in re.findall(r'selector:\s*([\w.]+)', open(y, encoding='utf-8').read()):
        parts = sel.split('.')
        routed.setdefault('.'.join(parts[:-1]), set()).add(parts[-1])

repo_dirs = sorted(set(r for rs in REPOS.values() for r in rs))
gateway_gaps = []
for repo in repo_dirs:
    src = repo_src(repo)
    for alias, svc in re.findall(r'(\w+)\.Register(\w+?)HandlerFromEndpoint\(', src):
        pkg = ALIAS.get(alias)
        key = f'{pkg}.{svc}'
        if not pkg or key not in routed:
            continue
        for meth in sorted(routed[key]):
            if not re.search(r'func \(\w+ \*' + svc + r'\w*Server\) ' + meth + r'\(', src):
                gateway_gaps.append(f'{repo}: 注册了 {key} 的 http 网关,却没实现 {meth} '
                                    f'—— web 调 http 会 "method {meth} not implemented"')

if gateway_gaps:
    print(f'[check_impl] ❌ http 暴露面漂移 {len(gateway_gaps)} 个(比上面更要命,直接 404/Unimplemented):')
    for g in gateway_gaps:
        print('    ' + g)
    if not WARN_ONLY:
        sys.exit(1)
    print('[check_impl] (--warn:只报不拦;后端跟完 proto 后仍报 = 真漂移)')
else:
    print('[check_impl] ✓ http 网关暴露面无漂移')

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
print('[check_impl] ✓ 所有 rpc 均能找到后端实现')

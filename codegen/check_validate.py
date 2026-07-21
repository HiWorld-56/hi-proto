"""扫描 validate.ValidateNotNil/NotZero 里用字符串写的字段名,核对它在 req 类型上真实存在。

背景:ValidateNotNil 用 reflect.FieldByName,字段**不存在**时与字段为 nil 走同一分支,
都报 "field X is required"。于是 proto 改名/删字段后,handler 里的字符串引用不会
编译报错,而是让接口**永远返回必填错误** —— hi.club Agent.Edit 就这么坏了(要求
EditAgentReq.Base,而该字段早已不存在)。
"""
import os, re, sys, glob, subprocess

ARGS = sys.argv[1:]
WARN = '--warn' in ARGS
PB_FROM = None
if '--pb-from' in ARGS:
    i = ARGS.index('--pb-from')
    PB_FROM = ARGS[i + 1]
    del ARGS[i:i + 2]
REPOS = [a for a in ARGS if not a.startswith('--')] or ['/home/lo/wip/backend-hi-club']
def _gomodcache():
    # 只有回落模式(按 go.mod 锁版本)才需要;--pb-from 下拿不到也无所谓,不要因此崩掉 CI。
    try:
        return subprocess.run(['go', 'env', 'GOMODCACHE'], capture_output=True, text=True,
                              env={**os.environ, 'PATH': os.environ['PATH'] + ':/home/lo/golang/go/bin'}
                              ).stdout.strip()
    except Exception:
        return ''

GOMODCACHE = _gomodcache()

# 收集 pb.go 里所有 message 的字段名。
# ⚠️ **必须锁定 go.mod 里的那个版本** —— GOMODCACHE 里躺着历史上所有版本,
#    全都读进来再合并,等于"任何版本存在过的字段都算存在",旧版本会把删掉的字段
#    重新盖回来,扫描就永远是绿的(第一版就这么漏掉了 EditAgentReq.Base)。
def proto_version(repo):
    for line in open(f'{repo}/go.mod', encoding='utf-8'):
        m = re.search(r'github\.com/HiWorld-56/hi-proto (\S+)', line)
        if m:
            return m.group(1)
    return None

def load_pb_dir(d):
    fields = {}
    pats = glob.glob(f'{d}/**/*.pb.go', recursive=True)
    if not pats:
        print(f'!! 找不到 {d} 下的 pb.go'); sys.exit(2)
    for f in pats:
        src = open(f, encoding='utf-8').read()
        for m in re.finditer(r'^type (\w+) struct \{(.*?)^\}', src, re.S | re.M):
            name, body = m.group(1), m.group(2)
            fs = set(re.findall(r'^\t(\w+)\s+', body, re.M))
            fields.setdefault(name, set()).update(fs)
    return fields


def load_pb_fields(ver):
    # GOMODCACHE 对大写做 !x 转义
    return load_pb_dir(f'{GOMODCACHE}/github.com/!hi!world-56/hi-proto@{ver}/go')

# --pb-from:用**刚生成的** pb.go 校验,回答"这次改 proto 会让哪个后端失效"。
# 不传则按各仓 go.mod 锁定的版本校验(那只能说明后端与它当前依赖自洽,对新 proto 一无所知)。
SHARED = None
if PB_FROM:
    SHARED = load_pb_dir(PB_FROM)
    print(f'[check_validate] 用新生成的 pb.go({PB_FROM}):{len(SHARED)} 个 message')

bad = []
for repo in REPOS:
    if not os.path.isdir(os.path.join(repo, 'internal')):
        continue  # 不是 Go 后端仓(wip 下还躺着 ComfyUI/pytorch 之类)
    if SHARED is not None:
        pb = SHARED
        print(f'[check_validate] 核对 {os.path.basename(repo)}')
    else:
        ver = proto_version(repo)
        if not ver:
            print(f'  跳过 {repo}(go.mod 里没有 hi-proto)'); continue
        pb = load_pb_fields(ver)
        print(f'[check_validate] {os.path.basename(repo)}: hi-proto {ver},{len(pb)} 个 message')
    for gofile in glob.glob(f'{repo}/internal/**/*.go', recursive=True):
        src = open(gofile, encoding='utf-8').read()
        lines = src.split('\n')
        for i, line in enumerate(lines):
            m = re.search(r'Validate(?:NotNil|NotZero)\((\w+),\s*\[\]string\{([^}]*)\}', line)
            if not m:
                continue
            var, names = m.group(1), re.findall(r'"(\w+)"', m.group(2))
            # 回溯最近的函数签名,取该变量的类型
            typ = None
            for j in range(i, max(-1, i - 60), -1):
                fm = re.search(r'func .*?\b' + re.escape(var) + r' \*([\w.]+)\)', lines[j])
                if fm:
                    typ = fm.group(1).split('.')[-1]
                    break
            if not typ:
                continue
            known = pb.get(typ)
            if known is None:
                continue  # 非 proto 类型,跳过
            for n in names:
                if n not in known:
                    bad.append((gofile, i + 1, typ, n, sorted(known)))

if bad:
    print(f'\n❌ {len(bad)} 处校验了**不存在的字段**(接口会永远报 "field X is required"):\n')
    for f, ln, typ, n, known in bad:
        rel = f.split('/wip/')[-1]
        print(f'  {rel}:{ln}')
        print(f'      {typ} 上没有字段 {n!r};它实际有:{", ".join(known[:8])}{" …" if len(known)>8 else ""}')
    if WARN:
        print('  (--warn:只报不拦。正常工作流是先改 proto 再跟后端,硬失败会卡死每次改名的第一次推送)')
        sys.exit(0)
    sys.exit(1)
print('[check_validate] ✓ 所有字段名都真实存在')

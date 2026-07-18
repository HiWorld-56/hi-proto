#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:鉴权标注 + http 路由。

背景:鉴权规则曾以方法路径字符串散落在各后端的 Go map 里,与 proto 无强制关联 ——
改名即静默漂移(实测 15 处)、删方法留悬空条目、漏配则 fail-open 落进宽松档。
现规则长在方法上(hi/options.proto 的 Auth 枚举),后端拦截器读 descriptor 判断。

鉴权模型(2026-07-17 起):**按主体命名 + 可组合**。
  option (hi.auth) 是 **repeated** —— 多行 = 任一通过(OR);空 = fail-closed。
  故本脚本必须按 **rpc 块**(而非单行)解析。

本脚本保证:
  1. 每个 rpc 都显式标注,且不用 AUTH_UNSPECIFIED(漏标即构建失败,而非上线后静默拒绝/放行);
  2. **同一 service 内档位集合一致** —— 不一致 = 主体归类错了,该拆 service
     (范式:DApp/DAppAdmin、Gateway/GatewayAdmin、Merchant/MerchantManage);
  3. http 路由不悬空、无重复 key。
"""
import re, sys, glob, os

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
bad, total = [], 0

# 允许共存的档位组合:公开 + web3。
# web3 的"鉴权"在载荷里(hi.SignedData,handler 自验签),不是方法级鉴权,
# 故它与 AUTH_NONE 同处一个 service 不算混档(如 Auth/Pay/Transfer/Assets)。
ALLOWED_MIX = {frozenset({('AUTH_NONE',), ('AUTH_WEB3',)})}

# 按 rpc 块解析:从 `rpc Name(` 到与之配对的 `}` 或 `;`
RPC_BLOCK = re.compile(
    r'rpc\s+(?P<name>\w+)\s*\([^)]*\)\s*returns\s*\([^)]*\)\s*(?:\{(?P<opts>.*?)\}|;)',
    re.S)


def line_of(src, pos):
    return src.count('\n', 0, pos) + 1


for f in sorted(glob.glob('hi/**/*.proto', recursive=True)):
    if f.endswith('options.proto'):
        continue
    src = open(f, encoding='utf-8').read()
    if not re.search(r'^service\s+\w+', src, re.M):
        continue
    if 'import "hi/options.proto";' not in src:
        bad.append(f'{f}: 定义了 service 却未 import hi/options.proto')

    for sm in re.finditer(r'^service\s+(\w+)\s*\{(.*?)^\}', src, re.S | re.M):
        svc, body = sm.group(1), sm.group(2)
        base = sm.start(2)
        sets = []
        for rm in RPC_BLOCK.finditer(body):
            total += 1
            name = rm.group('name')
            ln = line_of(src, base + rm.start())
            opts = rm.group('opts') or ''
            auths = re.findall(r'option\s*\(hi\.auth\)\s*=\s*(AUTH_[A-Z0-9_]+)\s*;', opts)
            if not auths:
                bad.append(f'{f}:{ln}: {svc}.{name} 未标注 hi.auth(空 = fail-closed,必须显式标)')
                continue
            if 'AUTH_UNSPECIFIED' in auths:
                bad.append(f'{f}:{ln}: {svc}.{name} 标了 AUTH_UNSPECIFIED(仅占位,不可主动使用)')
            dup = [a for a in set(auths) if auths.count(a) > 1]
            if dup:
                bad.append(f'{f}:{ln}: {svc}.{name} 重复标注 {dup}')
            sets.append((name, ln, tuple(sorted(set(auths)))))

        # 同 service 档位集合必须一致
        uniq = {a for _, _, a in sets}
        if len(uniq) > 1 and frozenset(uniq) not in ALLOWED_MIX:
            detail = '; '.join(f'{n}={"+".join(a)}' for n, _, a in sets)
            ln = sets[0][1] if sets else line_of(src, sm.start())
            bad.append(
                f'{f}:{ln}: service {svc} **混档** —— 同 service 档位必须一致,'
                f'不一致说明主体归类错了,该拆 service(见 DApp/DAppAdmin 范式)。当前:{detail}')

# ── 方法名不得撞目标语言的**保留字** ────────────────────────────────────────
# 真踩过:Plugin.PluginSwitch 去 stutter 改成 Plugin.Switch,而 **switch 是 Dart 保留字** ——
# dart 生成器吐出 `ResponseFuture<...> switch(...)`,语法错误,**整个 CI 生成挂掉**。
# 而 Go/Rust 里 Switch 完全合法,所以只测 go 生成根本发现不了。
#
# ⚠️ 只列**真保留字**(不能做标识符的)。get/set/在 Dart 里是"内置标识符",可以做方法名
#    (Merchant.Get / Group.Get 一直都在,别误伤)。
DART_RESERVED = {
    'assert', 'break', 'case', 'catch', 'class', 'const', 'continue', 'default', 'do', 'else',
    'enum', 'extends', 'false', 'final', 'finally', 'for', 'if', 'in', 'is', 'new', 'null',
    'rethrow', 'return', 'super', 'switch', 'this', 'throw', 'true', 'try', 'var', 'void',
    'while', 'with',
}
GO_RESERVED = {
    'break', 'case', 'chan', 'const', 'continue', 'default', 'defer', 'else', 'fallthrough',
    'for', 'func', 'go', 'goto', 'if', 'import', 'interface', 'map', 'package', 'range',
    'return', 'select', 'struct', 'switch', 'type', 'var',
}
RUST_RESERVED = {
    'as', 'break', 'const', 'continue', 'crate', 'else', 'enum', 'extern', 'false', 'fn', 'for',
    'if', 'impl', 'in', 'let', 'loop', 'match', 'mod', 'move', 'mut', 'pub', 'ref', 'return',
    'self', 'static', 'struct', 'super', 'trait', 'true', 'type', 'unsafe', 'use', 'where', 'while',
}

for f in sorted(glob.glob('hi/**/*.proto', recursive=True)):
    src = open(f, encoding='utf-8').read()
    for sm in re.finditer(r'^service\s+(\w+)\s*\{(.*?)^\}', src, re.S | re.M):
        for rm in re.finditer(r'rpc\s+(\w+)\s*\(', sm.group(2)):
            meth = rm.group(1)
            low = meth[0].lower() + meth[1:]  # 生成器多用 lowerCamel
            hit = []
            if low in DART_RESERVED:
                hit.append('Dart')
            if low in GO_RESERVED:
                hit.append('Go')
            if low in RUST_RESERVED:
                hit.append('Rust')
            if hit:
                bad.append(f'{f}: {sm.group(1)}.{meth} 撞 {"/".join(hit)} 保留字 —— '
                           f'生成的代码会语法错误(CI 生成会挂),换个名')

print(f'[check_auth] 共 {total} 个 rpc')

# ── http/*.yaml 的选择器必须指向真实存在的方法 ──────────────────────────
# 删 rpc 时很容易忘掉 http 路由,留下悬空选择器。那样 buf generate 会报
#   "HTTP rules without a matching selector: .hi.club.Base.ListSuperAdminUsers"
# 但这条报错夹在一堆"plugin protoc-gen-go: signal: killed"里,极难看出真因
# (protoc-gen-grpc-gateway 失败后其余插件被连带 kill)。在这里提前拦掉。
real = set()
for f in glob.glob('hi/**/*.proto', recursive=True):
    t = open(f, encoding='utf-8').read()
    pm = re.search(r'^package\s+([\w.]+);', t, re.M)
    if not pm:
        continue
    for sm in re.finditer(r'^service\s+(\w+)\s*\{(.*?)^\}', t, re.S | re.M):
        for rm in re.finditer(r'rpc\s+(\w+)\s*\(', sm.group(2)):
            real.add(f'{pm.group(1)}.{sm.group(1)}.{rm.group(1)}')

http_total = 0
for y in sorted(glob.glob('http/*.yaml')):
    if os.path.basename(y) == 'merged.yaml':
        continue
    t = open(y, encoding='utf-8').read()
    for m in re.finditer(r'-\s*selector:\s*([\w.]+)', t):
        http_total += 1
        if m.group(1) not in real:
            bad.append(f'{y}: http 路由指向不存在的方法 {m.group(1)}(删/改 rpc 时忘了改路由?)')

# 每个 selector 块里 method(get/post/..)和 body 最多各一个 —— 删路由块时容易删掉 selector
# 却漏删后续行,留下孤儿 body/method,buf 会以"mapping key already defined"报错(且淹在插件 kill 里)。
for y in sorted(glob.glob('http/*.yaml')):
    if os.path.basename(y) == 'merged.yaml':
        continue
    seen = {}
    for i, line in enumerate(open(y, encoding='utf-8'), 1):
        st = line.strip()
        if st.startswith('- selector:'):
            seen = {}
        else:
            for k in ('body:', 'get:', 'post:', 'put:', 'delete:'):
                if st.startswith(k):
                    seen[k] = seen.get(k, 0) + 1
                    if seen[k] > 1:
                        bad.append(f'{y}:{i}: 同一 selector 块出现重复的 {k}(删路由时漏删?)')

# ── URL 必须与 selector 同构:/api/v1/<service_snake>/<method_snake> ────────
# 规则依据:**档位不同 = 不同 service = 不同资源**(我们本就按"谁能访问"拆 service)。
# 让 URL 面与鉴权面同构的好处:**URL 自己就把档位说出来了** ——
#   /gateway_admin/set 一眼是超管口子,/gateway/list 一眼是客户端读;
#   若共用前缀(/gateway_config/set vs /gateway_config/list)长得一样,谁标错档位从 URL 上看不出来。
# 历史教训:曾出现 Merchant.RemoveUsers 挂两条 URL、以及 save_uesrs/delete_uesrs 拼写错误上线。
# **不设缩写特例**:机械蛇形化 DApp → d_app,而 prost 生成的模块名恰恰就是
# d_app_client / d_app_admin_client —— 与工具链一致才是真一致,
# 自定义特例只会造出第二套规则。


def snake(n):
    s = re.sub(r'(?<=[a-z0-9])(?=[A-Z])', '_', n)
    s = re.sub(r'(?<=[A-Z])(?=[A-Z][a-z])', '_', s)
    return s.lower()


for y in sorted(glob.glob('http/*.yaml')):
    if os.path.basename(y) == 'merged.yaml':
        continue
    lines = open(y, encoding='utf-8').read().split('\n')
    seen = set()
    for i, l in enumerate(lines):
        m = re.match(r'\s*-\s*selector:\s*hi\.(\w+)\.(\w+)\.(\w+)\s*$', l)
        if not m:
            continue
        pkg, svc, meth = m.groups()
        sel = f'hi.{pkg}.{svc}.{meth}'
        if sel in seen:
            bad.append(f'{y}:{i+1}: {sel} **挂了多条 URL** —— 同一方法只能有一个入口')
        seen.add(sel)
        if i + 1 < len(lines):
            vm = re.match(r'\s*(get|post|put|delete):\s*(\S+)', lines[i + 1])
            if vm:
                want = f'/api/v1/{snake(svc)}/{snake(meth)}'
                if vm.group(2) != want:
                    bad.append(f'{y}:{i+2}: {sel} 的 URL 与 selector 不同构 —— '
                               f'实为 {vm.group(2)},应为 {want}')

print(f'[check_auth] 共 {http_total} 条 http 路由')

# ══ 数据可见性(hi.visibility / hi.audience)机器强制 ═══════════════════════════
# auth 管"谁能调方法";这里管"返回数据里哪些字段能给这个受众看"。规则:
#   · 每个"方法返回值可达"的数据消息必须标 option (hi.audience);
#   · 该消息里每个字段必须标 [(hi.visibility)];
#   · level(field.visibility) <= level(message.audience)(受众由宽到窄 PUBLIC<PARTICIPANT<SELF)
#     —— SELF 字段落进更宽受众的消息 = 挂(结构性防泄漏,不靠运行时抹值)。
# 适用范围:仅方法返回值可达的数据消息(req 入参、纯内部消息不纳入)。
VIS_LEVEL = {'VIS_PUBLIC': 1, 'VIS_PARTICIPANT': 2, 'VIS_SELF': 3}
SCALARS = {'double', 'float', 'int32', 'int64', 'uint32', 'uint64', 'sint32', 'sint64',
           'fixed32', 'fixed64', 'sfixed32', 'sfixed64', 'bool', 'string', 'bytes'}
# 可见性强制开关:**默认硬强制**(2026-07-18 全仓 141/141 回填完成后翻开)——
#   任何"方法返回可达"的数据消息缺 audience、或其字段缺 visibility,CI 直接挂。
#   这才是"同事没法做错":新增/改返回消息必须声明给谁看,漏标即 fail-closed。
# 逃生口:VIS_ENFORCE=0 退回报告模式(仅对已标 audience 的消息硬校验层级/完整,缺 audience 的只列报告)——
#   仅供将来大重构临时批量回填时用,别常开。
VIS_ENFORCE = os.environ.get('VIS_ENFORCE') != '0'

messages = {}       # fqn -> {'audience', 'fields':[(fname,ftype_fqn_or_None,has_vis,vis,line)], 'file'}
_msg_short = {}     # 'pkg.Short' -> fqn(用于类型解析)


def _match_brace(s, open_pos):
    """给定 '{' 的位置,返回配对 '}' 的位置。"""
    depth = 0
    for i in range(open_pos, len(s)):
        if s[i] == '{':
            depth += 1
        elif s[i] == '}':
            depth -= 1
            if depth == 0:
                return i
    return len(s) - 1


def _parse_fields(body, pkg, prefix, fqn, f, src_off, full_src):
    """解析一个 message body 里的直接字段(含 oneof 内),并递归嵌套 message。"""
    flds = []
    # 先挖掉嵌套 message/enum/oneof 的**子块**,单独递归;剩下的按字段行解析。
    i = 0
    stripped = []  # (text, base_offset) 片段:非子块的普通正文
    while i < len(body):
        m = re.compile(r'\b(message|enum|oneof)\s+(\w+)\s*\{').search(body, i)
        if not m:
            stripped.append((body[i:], i))
            break
        stripped.append((body[i:m.start()], i))
        ob = m.end() - 1
        cb = _match_brace(body, ob)
        kind, nm = m.group(1), m.group(2)
        inner = body[ob + 1:cb]
        if kind == 'message':
            child_fqn = f'{fqn}.{nm}'
            _register_message(inner, pkg, child_fqn, f, src_off + ob + 1, full_src)
        elif kind == 'oneof':
            # oneof 内的字段属于本 message,继续当普通字段解析
            stripped.append((inner, src_off + ob + 1 - src_off))  # 近似 offset,仅用于行号兜底
        i = cb + 1

    for text, _off in stripped:
        for fm in re.finditer(
                r'^[ \t]*(?:(?:repeated|optional)\s+)?'
                r'(map<\s*[\w.]+\s*,\s*[\w.]+\s*>|[\w.]+)\s+(\w+)\s*=\s*\d+\s*(\[[^\]]*\])?\s*;',
                text, re.M):
            ftype, fname, opts = fm.group(1), fm.group(2), fm.group(3) or ''
            if ftype.startswith('map<'):
                ftype = ftype.split(',')[1].strip(' >')  # 取 value 类型
            vism = re.search(r'\(hi\.visibility\)\s*=\s*(VIS_[A-Z_]+)', opts)
            has_vis = vism is not None
            vis = vism.group(1) if vism else None
            # 记录字段(类型 fqn 解析推迟到全部注册完)
            flds.append([fname, ftype, has_vis, vis, 0])
    return flds


def _register_message(body, pkg, fqn, f, src_off, full_src):
    am = re.search(r'option\s*\(hi\.audience\)\s*=\s*(VIS_[A-Z_]+)\s*;', body)
    audience = am.group(1) if am else None
    flds = _parse_fields(body, pkg, '', fqn, f, src_off, full_src)
    messages[fqn] = {'audience': audience, 'fields': flds, 'file': f}
    _msg_short[f'{pkg}.{fqn.split(".")[-1]}'] = fqn


# 1) 注册所有 message
files = sorted(glob.glob('hi/**/*.proto', recursive=True))
for f in files:
    if f.endswith('options.proto'):
        continue
    src = open(f, encoding='utf-8').read()
    pm = re.search(r'^package\s+([\w.]+);', src, re.M)
    if not pm:
        continue
    pkg = pm.group(1)
    i = 0
    while True:
        m = re.compile(r'^message\s+(\w+)\s*\{', re.M).search(src, i)
        if not m:
            break
        ob = m.end() - 1
        cb = _match_brace(src, ob)
        _register_message(src[ob + 1:cb], pkg, f'{pkg}.{m.group(1)}', f, ob + 1, src)
        i = cb + 1


def _resolve(ftype, cur_fqn):
    """字段类型 -> message fqn(若是消息);否则 None(标量/枚举/well-known)。"""
    if ftype in SCALARS:
        return None
    if ftype.startswith('google.protobuf.'):
        return None
    if ftype in messages:
        return ftype
    # 带包名限定,如 hi.Entity / hi.ai.ToolSupply
    if '.' in ftype and ftype in messages:
        return ftype
    # 同包短名
    pkg = '.'.join(cur_fqn.split('.')[:-1])
    # cur_fqn 形如 hi.club.GroupMemberView;包名是 hi.club(可能多段)
    for cand in (ftype, f'{pkg}.{ftype}'):
        if cand in messages:
            return cand
    # 嵌套类型 A.B
    if f'{cur_fqn}.{ftype}' in messages:
        return f'{cur_fqn}.{ftype}'
    return _msg_short.get(f'{pkg}.{ftype}')


# 2) 方法返回值 -> 起点消息
returns = set()
for f in files:
    src = open(f, encoding='utf-8').read()
    pm = re.search(r'^package\s+([\w.]+);', src, re.M)
    if not pm:
        continue
    pkg = pm.group(1)
    for rm in re.finditer(r'rpc\s+\w+\s*\([^)]*\)\s*returns\s*\(\s*([\w.]+)\s*\)', src):
        rt = rm.group(1)
        fqn = _resolve(rt, f'{pkg}.x')
        if fqn:
            returns.add(fqn)

# 3) 可达闭包(顺着消息类型字段走)
reach, stack = set(), list(returns)
while stack:
    fqn = stack.pop()
    if fqn in reach or fqn not in messages:
        continue
    reach.add(fqn)
    for fld in messages[fqn]['fields']:
        child = _resolve(fld[1], fqn)
        if child and child not in reach:
            stack.append(child)

# 4) 校验
vis_missing_audience = []
for fqn in sorted(reach):
    msg = messages[fqn]
    aud = msg['audience']
    if aud is None:
        vis_missing_audience.append(fqn)
        if VIS_ENFORCE:
            bad.append(f'{msg["file"]}: 消息 {fqn} 可被方法返回,却未标 option (hi.audience)')
        continue
    alevel = VIS_LEVEL.get(aud)
    if alevel is None:
        bad.append(f'{msg["file"]}: 消息 {fqn} 的 audience={aud} 非法(用 VIS_PUBLIC/PARTICIPANT/SELF)')
        continue
    # 消息一旦标了 audience = opt-in 进本体系 → 其字段必须全标且层级合规(硬锁,不受 VIS_ENFORCE 门控)。
    for fname, ftype, has_vis, vis, _ln in msg['fields']:
        if not has_vis:
            bad.append(f'{msg["file"]}: {fqn}.{fname} 未标 [(hi.visibility)]'
                       f'（消息已标 audience 即锁定,每个字段必须声明受众）')
            continue
        vlevel = VIS_LEVEL.get(vis)
        if vlevel is None:
            bad.append(f'{msg["file"]}: {fqn}.{fname} 的 visibility={vis} 非法')
        elif vlevel > alevel:
            bad.append(f'{msg["file"]}: 🔒 {fqn}.{fname} 可见性 {vis} 比消息受众 {aud} 更私 —— '
                       f'私有字段不许放进更宽受众的消息(该字段应移到 audience 更窄的 view 类型)')

print(f'[check_auth] 可见性:方法返回可达数据消息 {len(reach)} 个,'
      f'已标 audience {len(reach) - len(vis_missing_audience)} 个,待回填 {len(vis_missing_audience)} 个'
      + ('' if VIS_ENFORCE else '(报告模式,设 VIS_ENFORCE=1 硬挂)'))
if vis_missing_audience and not VIS_ENFORCE:
    for fqn in vis_missing_audience:
        print(f'    [待回填 audience] {fqn}')

if bad:
    print(f'[check_auth] ❌ {len(bad)} 处问题:')
    for b in bad:
        print('   ', b)
    sys.exit(1)
print('[check_auth] ✓ 鉴权标注(含同 service 档位一致)+ http 路由 均已校验')

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:每个 rpc 必须显式标注 hi.auth,且不得为 AUTH_UNSPECIFIED。

背景:鉴权规则曾以方法路径字符串散落在各后端的 Go map 里,与 proto 无强制关联 ——
改名即静默漂移(实测 15 处)、删方法留悬空条目、漏配则 fail-open 落进宽松档。
现规则长在方法上(hi/options.proto 的 Auth 枚举),后端拦截器读 descriptor 判断。
本脚本保证:proto 侧不会出现漏标 —— 漏标即构建失败,而非上线后静默拒绝/放行。
"""
import re, sys, glob, os

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
bad, total = [], 0
for f in sorted(glob.glob('hi/**/*.proto', recursive=True)):
    if f.endswith('options.proto'):
        continue
    src = open(f, encoding='utf-8').read()
    if not re.search(r'^service\s+\w+', src, re.M):
        continue
    if 'import "hi/options.proto";' not in src:
        bad.append(f'{f}: 定义了 service 却未 import hi/options.proto')
    svc = None
    for i, line in enumerate(src.split('\n'), 1):
        m = re.match(r'\s*service\s+(\w+)', line)
        if m:
            svc = m.group(1)
            continue
        m = re.match(r'\s*rpc\s+(\w+)\s*\(', line)
        if not m:
            continue
        total += 1
        if 'option (hi.auth)' not in line:
            bad.append(f'{f}:{i}: {svc}.{m.group(1)} 未标注 hi.auth')
        elif 'AUTH_UNSPECIFIED' in line:
            bad.append(f'{f}:{i}: {svc}.{m.group(1)} 标了 AUTH_UNSPECIFIED(仅作漏标哨兵,不可主动使用)')

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
    for sm in re.finditer(r'service\s+(\w+)\s*\{(.*?)\n\}', t, re.S):
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
            bad.append(f'{y}: http 路由指向不存在的方法 {m.group(1)}(删 rpc 时忘了删路由?)')
# 每个 selector 块里 method(get/post/..)和 body 最多各一个 —— 删路由块时容易删掉 selector
# 却漏删后续行,留下孤儿 body/method,buf 会以"mapping key already defined"报错(且淹在插件 kill 里)。
for y in sorted(glob.glob('http/*.yaml')):
    if os.path.basename(y) == 'merged.yaml':
        continue
    seen = {}
    sel = None
    for i, line in enumerate(open(y, encoding='utf-8'), 1):
        st = line.strip()
        if st.startswith('- selector:'):
            sel = st; seen = {}
        else:
            for k in ('body:', 'get:', 'post:', 'put:', 'delete:'):
                if st.startswith(k):
                    seen[k] = seen.get(k, 0) + 1
                    if seen[k] > 1:
                        bad.append(f'{y}:{i}: 同一 selector 块出现重复的 {k}(删路由时漏删?)')

print(f'[check_auth] 共 {http_total} 条 http 路由')

if bad:
    print(f'[check_auth] ❌ {len(bad)} 处问题:')
    for b in bad:
        print('   ', b)
    sys.exit(1)
print('[check_auth] ✓ 鉴权标注 + http 路由 均已校验')

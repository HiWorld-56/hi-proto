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
if bad:
    print(f'[check_auth] ❌ {len(bad)} 处问题:')
    for b in bad:
        print('   ', b)
    sys.exit(1)
print('[check_auth] ✓ 全部已标注')

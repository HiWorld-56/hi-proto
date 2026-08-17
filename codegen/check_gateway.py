#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:proto 配了 http 路由的 service,后端必须注册 grpc-gateway handler。

背景:路由链路有**两段**,断哪一段都是 404,但两段的失败长得一模一样:
  ① proto 侧 http/*.yaml 配 selector  → check_auth 已覆盖
  ② Go 侧 RegisterXxxHandlerFromEndpoint → **本脚本覆盖**
hi.club.Merchant 就是断在②:grpc 注册了、http 路由也配了,唯独 gateway 没注册,
于是 /api/v1/merchant/* 全部 code 5,而 grpcurl 直连完全正常 —— 极难看出真因。

用法:check_gateway.py <repo>...   [--warn]
"""
import re, sys, glob, os

ARGS = [a for a in sys.argv[1:] if not a.startswith('--')]
WARN = '--warn' in sys.argv
HIPROTO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# proto 侧:哪些 service 配了 http 路由
routed = {}
for y in glob.glob(f'{HIPROTO}/http/*.yaml'):
    if os.path.basename(y) == 'merged.yaml':
        continue
    for sel in re.findall(r'-\s*selector:\s*([\w.]+)', open(y, encoding='utf-8').read()):
        pkg_svc, _, _ = sel.rpartition('.')
        routed.setdefault(pkg_svc, []).append(sel)

bad = []
# import 别名 → proto 包名(hiclub "…/go/hi/club" → hi.club)。
# **必须按包配对**:club/ai/did 三个包都有叫 Merchant 的 service,只按简名匹配
# 会把别家的 service 算到本仓头上(第一版就这么误报了 3 条)。
IMPORT_RE = re.compile(r'(\w+)\s+"github\.com/HiWorld-56/hi-proto(?:-code)?/go/(hi(?:/\w+)?)"')

for repo in ARGS:
    routers = glob.glob(f'{repo}/internal/router/httprouter/*.go')
    grpcs = glob.glob(f'{repo}/internal/router/grpcrouter/*.go')
    if not routers or not grpcs:
        continue
    http_src = '\n'.join(open(f, encoding='utf-8').read() for f in routers)
    grpc_src = '\n'.join(open(f, encoding='utf-8').read() for f in grpcs)

    alias2pkg = {a: p.replace('/', '.') for a, p in IMPORT_RE.findall(grpc_src)}
    for alias, svc in re.findall(r'(\w+)\.Register(\w+?)Server\(', grpc_src):
        pkg = alias2pkg.get(alias)
        if not pkg:
            continue
        full = f'{pkg}.{svc}'
        if full not in routed:          # 没配 http 路由 —— 归 check_auth 的 optout 管
            continue
        if not re.search(rf'{re.escape(alias)}\.Register{re.escape(svc)}HandlerFromEndpoint\(', http_src):
            bad.append(f'{os.path.basename(repo)}: {full} 配了 {len(routed[full])} 条 http 路由,'
                       f'但没有 {alias}.Register{svc}HandlerFromEndpoint —— '
                       f'grpc 通、http 全 404')

if bad:
    print(f'\n❌ {len(bad)} 个 service 的 http 网关未注册:\n')
    for b in bad:
        print(f'  {b}')
    if WARN:
        print('  (--warn:只报不拦)')
        sys.exit(0)
    sys.exit(1)
print('[check_gateway] ✓ 所有配了 http 路由的 service 都已注册网关')

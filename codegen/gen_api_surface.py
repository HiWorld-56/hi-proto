#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""从 proto 生成接口全量核对表 → .claude/api-surface.md

为什么要生成而不是手写:上一份是手写的,内容停在重构前 —— 档位表里还是
AUTH_TOKEN/AUTH_API_KEY/AUTH_EXTEND_TOKEN(早已删除的枚举)、320 个 rpc
(实际 260)、方法名还是 ListLlmModels/GetAgentMaster 这些已改名或已删的。
作为交付材料会被当成当前接口清单,误导性比没有更大。

由 release.sh 每次发布时重跑,不再手工维护。
"""
import re, glob, os, subprocess

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

RPC = re.compile(r'rpc\s+(\w+)\s*\(\s*(stream\s+)?([\w.]+)\s*\)\s*returns\s*\(\s*(stream\s+)?([\w.]+)\s*\)\s*(?:\{(.*?)\}|;)', re.S)

routes = {}
for y in glob.glob('http/*.yaml'):
    if os.path.basename(y) == 'merged.yaml':
        continue
    t = open(y, encoding='utf-8').read()
    for m in re.finditer(r'-\s*selector:\s*([\w.]+)\n(?:\s*#[^\n]*\n)*\s*(get|post|put|delete):\s*(\S+)', t):
        routes[m.group(1)] = f'{m.group(2).upper()} {m.group(3)}'

rows, tiers = [], {}
for f in sorted(glob.glob('hi/**/*.proto', recursive=True)):
    src = open(f, encoding='utf-8').read()
    pm = re.search(r'^package ([\w.]+);', src, re.M)
    if not pm:
        continue
    pkg = pm.group(1)
    for sm in re.finditer(r'^service (\w+) \{(.*?)^\}', src, re.S | re.M):
        svc = sm.group(1)
        for rm in RPC.finditer(sm.group(2)):
            name, sin, req, sout, resp, opts = rm.groups()
            auths = re.findall(r'option\s*\(hi\.auth\)\s*=\s*(AUTH_[A-Z0-9_]+)\s*;', opts or '')
            tier = '+'.join(sorted(set(auths))) or '(未标)'
            for a in set(auths):
                tiers[a] = tiers.get(a, 0) + 1
            full = f'{pkg}.{svc}.{name}'
            flow = ('流式' if (sin or sout) else '')
            rows.append((pkg, svc, name, tier, req, resp, routes.get(full, '—'), flow))

ver = subprocess.run(['git', 'describe', '--tags', '--abbrev=0'], capture_output=True, text=True).stdout.strip()
sha = subprocess.run(['git', 'rev-parse', '--short', 'HEAD'], capture_output=True, text=True).stdout.strip()

out = ['# hi-proto 接口全量核对表', '',
       f'**由 codegen/gen_api_surface.py 生成,勿手工编辑**(基于 `{ver}` @ `{sha}`)。',
       '上一版是手写的,内容停在重构前 —— 档位名、rpc 数量、方法名全部过时,'
       '当成当前清单会被误导,故改为随发布自动重生成。', '',
       f'共 **{len(rows)}** 个 rpc。档位定义见 `hi/options.proto`;'
       '`hi.auth` 是 repeated,多档位 = 任一通过。', '', '## 档位分布', '',
       '| 档位 | 数量 |', '|---|---|']
out += [f'| `{k}` | {v} |' for k, v in sorted(tiers.items(), key=lambda x: -x[1])]

cur = None
out += ['', '## 全量清单', '']
for pkg, svc, name, tier, req, resp, route, flow in sorted(rows):
    if (pkg, svc) != cur:
        cur = (pkg, svc)
        out += ['', f'### {pkg}.{svc}', '',
                '| 方法 | 档位 | 入参 | 返回 | HTTP |', '|---|---|---|---|---|']
    out.append(f'| {name}{" ⇄" if flow else ""} | `{tier}` | {req} | {resp} | {route} |')

os.makedirs('.claude', exist_ok=True)
open('.claude/api-surface.md', 'w', encoding='utf-8').write('\n'.join(out) + '\n')
print(f'[gen_api_surface] ✓ {len(rows)} 个 rpc → .claude/api-surface.md')

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:塞进 google.protobuf.Any 的类型,其 audience 不得比宿主字段的可见性更严。

背景:可见性规则是 `level(field.visibility) <= level(message.audience)`,由 check_auth
在 proto 上强制。但 **Any 让这条规则失效** —— 装进去的真实类型 lint 看不见。
hi.club.Notice.extra(VIS_PARTICIPANT)曾装 hi.ai.PluginView(VIS_SELF,含私有 bucket
的脚本包地址),SELF 装进 PARTICIPANT 本该被拦,只因隔了个 Any 就一路放行。

做法:扫后端里 `anypb.New(x)` 的实参,推出它的 proto 类型,查该类型的 audience,
与宿主字段的 visibility 比较。宿主目前只有 Notice.extra / Message.extra 两处,
写死在 HOSTS 里 —— 新增 Any 字段时要同步加进来(否则这里查不到,等于没防)。

用法:check_any.py <repo>...  [--warn]
"""
import re, sys, glob, os

ARGS = [a for a in sys.argv[1:] if not a.startswith('--')]
WARN = '--warn' in sys.argv
HIPROTO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

LEVEL = {'VIS_PUBLIC': 1, 'VIS_PARTICIPANT': 2, 'VIS_SELF': 3}
# 宿主:含 Any 字段的消息 → 该字段的可见性
HOSTS = {'Notice.extra': 'VIS_PARTICIPANT', 'Message.extra': 'VIS_PARTICIPANT'}
HOST_LEVEL = min(LEVEL[v] for v in HOSTS.values())

# proto 里每个 message 的 audience
audience = {}
for f in glob.glob(f'{HIPROTO}/hi/**/*.proto', recursive=True):
    src = open(f, encoding='utf-8').read()
    for m in re.finditer(r'^message (\w+) \{(.*?)^\}', src, re.S | re.M):
        a = re.search(r'option \(hi\.audience\) = (VIS_\w+);', m.group(2))
        if a:
            audience[m.group(1)] = a.group(1)

bad = []
for repo in ARGS:
    for gofile in glob.glob(f'{repo}/internal/**/*.go', recursive=True):
        src = open(gofile, encoding='utf-8').read()
        lines = src.split('\n')
        for i, line in enumerate(lines):
            m = re.search(r'anypb\.New\((\w+)\)', line)
            if not m:
                continue
            var = m.group(1)
            # 往回找该变量的类型:形如 `var *hiai.PluginView` 或 `var := &hiai.PluginView{`
            typ = None
            for j in range(i, max(-1, i - 80), -1):
                tm = (re.search(rf'\b{re.escape(var)}\s+\*[\w]+\.(\w+)\b', lines[j])
                      or re.search(rf'\b{re.escape(var)}\s*:?=\s*&[\w]+\.(\w+)\{{', lines[j]))
                if tm:
                    typ = tm.group(1); break
            if not typ:
                continue
            a = audience.get(typ)
            if a and LEVEL[a] > HOST_LEVEL:
                rel = gofile.split('/wip/')[-1]
                bad.append(f'{rel}:{i+1}: anypb.New({var}) 装的是 {typ}({a}),'
                           f'而 Any 宿主字段是 VIS_PARTICIPANT —— 更严的类型装进更宽的载体,'
                           f'等于绕过可见性规则。换成 PARTICIPANT 或更宽的摘要类型。')

if bad:
    print(f'\n❌ {len(bad)} 处 Any 载荷可见性越界:\n')
    for b in bad:
        print(f'  {b}')
    if WARN:
        print('  (--warn:只报不拦)')
        sys.exit(0)
    sys.exit(1)
print(f'[check_any] ✓ Any 载荷可见性合规(已知 {len(audience)} 个 message 的 audience)')

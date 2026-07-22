#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:后端的流式白名单(streamApi)是否跟得上 proto 的 server-streaming 路由。

背景:club/ai 的 http 网关有个 ResponseWrapperMiddleware,把普通响应缓存后包成
{code,message,data} 信封;流式端点(多块 JSON)不能缓存,靠一个**硬编码路径白名单**
`var streamApi = []string{...}` 放行、直连。

真踩过:proto 把 Chat.DialogStream 改名成 CompleteStream(/chat/dialog_stream →
/chat/complete_stream),这个硬编码列表**没跟** —— complete_stream 不在白名单,流式响应
被当普通响应缓存、Unmarshal 成单 JSON 失败 → 前端收到空/done。它是纯字符串、无类型引用,
改名时没有任何 lint 提醒(不像 check_impl 能靠类型/注册抓 handler 漂移)。

判据:一个后端若声明了 `streamApi`,它必须**恰好等于**该后端所服务 proto 包里
所有 server-streaming rpc 的 http 路由集合。少了 → 流式端点静默变空;多了(旧路径没删)
→ 无害但是垃圾。

用法:check_stream.py <repo>...   （没有 streamApi 的后端自动跳过）
"""
import re, sys, os, glob

HIPROTO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REPOS = [a for a in sys.argv[1:] if not a.startswith('--')]
WARN = '--warn' in sys.argv

# 目录名 → proto 包
PKG_OF = {'backend-hi-ai': 'hi.ai', 'backend-hi-club': 'hi.club',
          'backend-hi-did': 'hi.did', 'backend-hi-source': 'hi.source'}

# proto: (pkg) → { server-streaming rpc 全名 -> http 路由 }
routed = {}   # fqmn -> url
streaming = set()  # fqmn(server-streaming)
for f in glob.glob(os.path.join(HIPROTO, 'hi', '**', '*.proto'), recursive=True):
    s = open(f, encoding='utf-8').read()
    pkg = re.search(r'^package\s+([\w.]+);', s, re.M).group(1)
    cur = None
    for line in s.splitlines():
        m = re.match(r'^service\s+(\w+)', line)
        if m:
            cur = m.group(1); continue
        m = re.search(r'rpc\s+(\w+)\s*\([^)]*\)\s*returns\s*\(\s*stream\b', line)
        if m and cur:
            streaming.add(f'{pkg}.{cur}.{m.group(1)}')
for y in glob.glob(os.path.join(HIPROTO, 'http', '*.yaml')):
    sel = None
    for line in open(y, encoding='utf-8'):
        m = re.match(r'\s*-\s*selector:\s*([\w.]+)', line)
        if m:
            sel = m.group(1); continue
        m = re.match(r'\s*(?:post|get):\s*(\S+)', line)
        if m and sel:
            routed[sel] = m.group(1); sel = None

bad = []
checked = 0
for repo in REPOS:
    name = os.path.basename(repo.rstrip('/'))
    pkg = PKG_OF.get(name)
    if not pkg:
        continue
    # 找 streamApi 声明
    src = None
    for gf in glob.glob(os.path.join(repo, 'internal', '**', '*.go'), recursive=True):
        t = open(gf, encoding='utf-8', errors='ignore').read()
        if 'streamApi' in t and '[]string{' in t:
            src = t; break
    if src is None:
        continue
    checked += 1
    m = re.search(r'streamApi\s*=\s*\[\]string\{([^}]*)\}', src, re.S)
    have = set(re.findall(r'"([^"]+)"', m.group(1))) if m else set()
    want = {routed[fq] for fq in streaming if fq.startswith(pkg + '.') and fq in routed}
    missing = want - have
    stale = have - want
    if missing or stale:
        bad.append((name, sorted(missing), sorted(stale)))

if bad:
    print('[check_stream] ✗ streamApi 白名单与 proto 流式路由不符:')
    for name, missing, stale in bad:
        if missing:
            print(f'  {name}: **缺** {missing} —— 这些流式端点会被信封中间件缓存 → 前端收到空')
        if stale:
            print(f'  {name}: 多余(旧路径没删){stale}')
    if not WARN:
        sys.exit(1)
    print('  (--warn:只报不拦)')
else:
    print(f'[check_stream] ✓ {checked} 个后端的 streamApi 与 proto 流式路由一致')

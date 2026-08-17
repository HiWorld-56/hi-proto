#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:各 Go 后端有没有新增死代码(不可达函数)。

`deadcode`(golang.org/x/tools)从 cmd/main 做全程序可达性分析。价值:
proto 改需求时爱新写一个带后缀/变体的方法、旧的不删,越攒越多;deadcode 一把喊出来。
6 个后端已在 2026-07 全清到 0(见 record/…死代码清单.md),从干净起步,新增即显形。

⚠️ **必须 --warn**(与 check_impl/check_lockstep 一致):
  · deadcode 保守地看不到反射调用,极少数情况会误报(真踩过:handler 若没注册
    到 grpc 会被判死 —— 那其实是"该注册没注册"的真问题,但语义上不是死代码)。
  · 硬失败会卡住正常开发(重构中途本就会短暂出现不可达)。
  它的作用是**把新增死代码喊出来**,不是替人拦门。

⚠️ **删死代码别手写文本脚本**:必须花括号配平定位函数体,不能假设"函数以行首 } 结尾"
   —— 单行函数 `func F(){...}` 会让这类脚本一路吞到下一个函数,误删真 handler
   (2026-07 真踩过,吃掉了 hi.did.Assets.Total,build 不报、只 check_impl 抓到)。

用法:check_deadcode.py <repo>...   （每个 repo 需含 go.mod + cmd/;无则跳过）
"""
import sys, os, subprocess

REPOS = [a for a in sys.argv[1:] if not a.startswith('--')]

# deadcode 二进制:PATH 里找,找不到就报缺失(不硬失败)。
def deadcode_bin():
    for p in os.environ.get('PATH', '').split(':'):
        c = os.path.join(p, 'deadcode')
        if os.path.isfile(c):
            return c
    # go bin 常见位置
    for c in (os.path.expanduser('~/go/bin/deadcode'), '/home/lo/go/bin/deadcode'):
        if os.path.isfile(c):
            return c
    return None

BIN = deadcode_bin()
if not BIN:
    print('[check_deadcode] ⚠️ 未找到 deadcode 二进制(go install golang.org/x/tools/cmd/deadcode@latest),跳过')
    sys.exit(0)

total_dead = 0
reported = []
for repo in REPOS:
    if not os.path.exists(os.path.join(repo, 'go.mod')) or not os.path.isdir(os.path.join(repo, 'cmd')):
        continue
    out = subprocess.run([BIN, './cmd/...'], cwd=repo, capture_output=True, text=True).stdout
    dead = [l for l in out.splitlines() if 'unreachable func' in l]
    name = os.path.basename(repo.rstrip('/'))
    if dead:
        total_dead += len(dead)
        reported.append((name, dead))

if not reported:
    print('[check_deadcode] ✓ 各后端无死代码(0 个不可达函数)')
    sys.exit(0)

print(f'[check_deadcode] ⚠️ {total_dead} 个不可达函数(--warn:只报不拦):')
for name, dead in reported:
    print(f'  {name}: {len(dead)} 个')
    for l in dead[:8]:
        print('      ' + l.split('unreachable func: ')[-1])
    if len(dead) > 8:
        print(f'      … 另 {len(dead) - 8} 个(在该仓跑 `deadcode ./cmd/...` 看全)')
print('  → 新增的多半是"改需求时新写方法、旧的没删";确认后删(花括号配平,别手写文本脚本)。')
sys.exit(0)

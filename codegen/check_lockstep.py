#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:所有消费方是否都用同一个 hi-proto 版本。

**开发阶段字段号可以随便改**(不做向后兼容),前提是**所有仓 lockstep 升级**。
这条前提一旦破了,后果是编译期查不出的线上故障:

  真踩过 —— GetUserReq 删掉 merchant=1 后 user 从 2 挪到 1,而 hi-ai 停在旧版:
  它按老编号(2)编码、hi-did 按新编号(1)解析,收到空字符串。所有仓编译全过,
  CreateAssistant 整条链路却挂掉,报错还是 validate 的 "pattern 不匹配",
  完全指不到真因,直到冒烟从 21 项掉到 9 通过 3 失败才暴露。

所以真正该守的不是"字段号别动",而是"动了之后没人掉队"。

用法:check_lockstep.py <repo>...  [--warn]
"""
import re, sys, os, glob, subprocess

ARGS = [a for a in sys.argv[1:] if not a.startswith('--')]
WARN = '--warn' in sys.argv
HIPROTO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

latest = subprocess.run(['git', '-C', HIPROTO, 'tag', '--sort=-creatordate'],
                        capture_output=True, text=True).stdout.split()
latest = next((t for t in latest if t.startswith('v')), None)

versions = {}
for repo in ARGS:
    gomod = os.path.join(repo, 'go.mod')
    if not os.path.exists(gomod):
        continue
    m = re.search(r'github\.com/HiWorld-56/hi-proto (\S+)', open(gomod, encoding='utf-8').read())
    if m:
        versions[os.path.basename(repo)] = m.group(1)

if not versions:
    print('[check_lockstep] 没找到任何消费方,跳过'); sys.exit(0)

uniq = set(versions.values())
for name, v in sorted(versions.items()):
    mark = '' if len(uniq) == 1 else ('  ← 落后' if v != max(uniq) else '')
    print(f'  {name:<24} {v}{mark}')

if len(uniq) > 1:
    print(f'\n❌ 消费方 proto 版本不一致:{sorted(uniq)}')
    print('   开发阶段字段号会变且不做兼容,**必须全仓 lockstep**;')
    print('   落后的仓会按老编号编解码,收到空值 —— 编译期查不出,只有线上行为错。')
    if WARN:
        print('   (--warn:只报不拦)')
        sys.exit(0)
    sys.exit(1)

only = uniq.pop()
if latest and only != latest:
    print(f'\n⚠️ 全仓一致({only}),但不是最新 tag({latest})—— 发布后记得整体抬版本。')
print(f'[check_lockstep] ✓ 所有消费方版本一致({only})')

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:字段号不得被复用或改动(与上一个已发布 tag 比对)。

删字段后让后面的字段挪位、或把新字段塞进已删字段的编号,是**隐形破坏**:
字段名没变 → 各仓编译全过;但没升级的仓按老编号编码、新版按新编号解析,
收到的是空值。**编译期零提示,只有线上行为错**,报错还常常指向别处。

真踩过:hi.did.GetUserReq 删掉 merchant=1 后 user 从 2 挪到 1,而 hi-ai 停在旧版,
它编码 user=2、did 解析 field 1 → 空 user,CreateAssistant 整条链路挂掉,
错误信息却是 validate 的 "pattern 不匹配"。

判据:同名 message 的同名字段,编号不得变化。新增字段任选未用过的号即可;
删字段不必写 reserved(本仓有意不用),但**留下的空号不得再被占用**。

用法:check_fieldnum.py [--warn]  (在 hi-proto 仓内运行,与上一个 v* tag 比对)
"""
import re, sys, subprocess, os

WARN = '--warn' in sys.argv
os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

FIELD = re.compile(r'^\s*(?:repeated\s+|optional\s+)?[\w.]+\s+(\w+)\s*=\s*(\d+)\s*[;\[]', re.M)


def fields_of(text):
    """{message 名: {字段名: 编号}}"""
    out = {}
    for m in re.finditer(r'^message (\w+) \{(.*?)^\}', text, re.S | re.M):
        name, body = m.group(1), m.group(2)
        # 去掉嵌套 message,避免把内层字段算到外层
        body = re.sub(r'^\s+message \w+ \{.*?^\s+\}', '', body, flags=re.S | re.M)
        out.setdefault(name, {}).update({f: int(n) for f, n in FIELD.findall(body)})
    return out


def at_rev(rev, path):
    r = subprocess.run(['git', 'show', f'{rev}:{path}'], capture_output=True, text=True)
    return r.stdout if r.returncode == 0 else None


# 基线默认取最近的 tag。可用 --base 指定 —— 唯一的正当用途是**上一个 tag 本身就错**
# (编号已经被挪过),这时要拿更早的正确版本作基线,否则等于把错误固化成基准。
# 真发生过:dev.25/26 里 GetUserReq.user 被挪到 1,修回 2 时相对它们反而"变动"了。
base = None
if '--base' in sys.argv:
    base = sys.argv[sys.argv.index('--base') + 1]
else:
    tags = subprocess.run(['git', 'tag', '--sort=-creatordate'], capture_output=True, text=True).stdout.split()
    base = next((t for t in tags if t.startswith('v')), None)
if not base:
    print('[check_fieldnum] 没有可比对的 tag,跳过'); sys.exit(0)

bad = []
files = subprocess.run(['git', 'ls-files', 'hi/'], capture_output=True, text=True).stdout.split()
for path in files:
    if not path.endswith('.proto'):
        continue
    old_src = at_rev(base, path)
    if old_src is None:
        continue  # 新文件
    old, new = fields_of(old_src), fields_of(open(path, encoding='utf-8').read())
    for msg, oldf in old.items():
        newf = new.get(msg)
        if not newf:
            continue  # message 整个删了,不管
        for fname, num in oldf.items():
            if fname in newf and newf[fname] != num:
                bad.append(f'{path}: {msg}.{fname} 字段号 {num} → {newf[fname]}(与 {base} 相比)')
        # 新字段占用了已删字段的号
        used_old = {n: f for f, n in oldf.items()}
        for fname, num in newf.items():
            if fname not in oldf and num in used_old:
                bad.append(f'{path}: {msg}.{fname} 占用了已删字段 {used_old[num]} 的编号 {num}')

if bad:
    print(f'\n❌ {len(bad)} 处字段号变动/复用(隐形破坏,编译期查不出):\n')
    for b in bad:
        print(f'  {b}')
    print('\n  删字段时让后面的字段挪位、或复用空出的编号,会让未升级的消费方收到空值。')
    print('  新增字段请另取未用过的号;空出来的号就让它空着。')
    if WARN:
        print('  (--warn:只报不拦)')
        sys.exit(0)
    sys.exit(1)
print(f'[check_fieldnum] ✓ 字段号未变动(基线 {base})')

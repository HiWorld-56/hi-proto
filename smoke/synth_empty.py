#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""查「**凭空造出空串**」这一类:裸 string 局部变量,无条件被 `proto.String()` 包出去。

## 为什么库检查和接口检查都抓不到它

这一轮的三道闸各有各的盲区:

    gen_nullq / gen_emptyq   比的是**库**和 Go 类型 —— 而这个空串根本不来自库
    null_static 第 4 闸       查的是 SQL 里的 COALESCE —— 也不是它
    empty_in_resp            端到端数回包 —— 只覆盖得到**有数据**的路由

而这一类的空串是 handler 自己造的:

    var role string                  // 零值就是 ""
    if groupMember != nil {
        role = groupMember.Role
    }
    ...
    Role: proto.String(role),        // ← 不是成员时发出「有角色,它是空串」

2026-09-03 用这个判据扫出**四个**,而端到端检查一个都够不着(它们都在
"未观察字段"那一批里):

  · hi-did  auth.go     mqttPassword  → 客户端拿空串去连 broker,**而 MQTT 拒绝是静默的**
  · club    group.go    role          → 不是成员被发成"某种未知角色"
  · club    user.go     moment        → 机器人恒发 `"moment": ""`
  · hi-ai   dto/chat.go content       → 「这是张图,地址是空串」

## 判据

`var x string`(无初值)或 `x := ""` → 同一函数体内出现 `proto.String(x)`。

⚠️ **先剥注释和字符串**。第一版没剥,把**说明这条规矩的注释本身**匹配成了违规
(assets.go 里那段讲"原来写的是 `var exchange string`"的注释)——
判据写错时,红的样子和真 bug 一模一样。
"""
import os
import re
import sys

REPOS = ["backend-hi-did", "backend-hi-club", "backend-hi-ai",
         "backend-hi-club-trade", "backend-hi-source", "backend-hi-ai-plugin"]

# 允许名单:**看着像、实际不可能为空**的地方。每条都要写清为什么 ——
# 不写理由的白名单,下一轮没人敢删,而它会一直盖着一个真问题。
ALLOW = {
    # switch 的 default 分支直接 `return "", nil, fmt.Errorf(...)`,
    # 所以走到下面那句 proto.String 时 msgType 必然已被赋值。
    # (这条判据只做词法匹配,不做数据流分析 —— 分析得起就不用白名单了。)
    "backend-hi-club:internal/service/builder/group_notice.go:msgType",
}


def strip_go(src):
    """剥掉注释与字符串字面量,位置用空格占住(行号不能变)。"""
    out = []
    i, n = 0, len(src)
    while i < n:
        c = src[i]
        if c == '/' and i + 1 < n and src[i + 1] == '/':
            while i < n and src[i] != '\n':
                out.append(' '); i += 1
            continue
        if c == '/' and i + 1 < n and src[i + 1] == '*':
            while i < n and not (src[i] == '*' and i + 1 < n and src[i + 1] == '/'):
                out.append('\n' if src[i] == '\n' else ' '); i += 1
            out.append('  '); i += 2
            continue
        if c in '"`':
            q = c
            out.append(' '); i += 1
            while i < n and src[i] != q:
                if q == '"' and src[i] == '\\':
                    out.append(' '); i += 1
                out.append('\n' if src[i] == '\n' else ' ')
                i += 1
            out.append(' '); i += 1
            continue
        out.append(c); i += 1
    return ''.join(out)


DECL = re.compile(r'\bvar (\w+) string\b(?!\s*=)|^\s*(\w+) := ""\s*$', re.M)


def scan_repo(root):
    hits = []
    files = 0
    for dp, dn, fn in os.walk(root):
        dn[:] = [d for d in dn if d not in ("vendor", ".git", "node_modules", "target")]
        for f in fn:
            if not f.endswith(".go") or f.endswith("_test.go"):
                continue
            p = os.path.join(dp, f)
            try:
                raw = open(p, encoding="utf-8", errors="ignore").read()
            except OSError:
                continue
            files += 1
            src = strip_go(raw)
            for m in DECL.finditer(src):
                name = m.group(1) or m.group(2)
                if not name:
                    continue
                # 只看同一函数体内(粗略:往后 3000 字符,遇到下一个顶格 func 就停)
                tail = src[m.end():m.end() + 3000]
                nxt = re.search(r'^func ', tail, re.M)
                if nxt:
                    tail = tail[:nxt.start()]
                if re.search(r'proto\.String\(\s*%s\s*\)' % re.escape(name), tail):
                    ln = src[:m.start()].count("\n") + 1
                    rel = os.path.relpath(p, root)
                    if f"{os.path.basename(root)}:{rel}:{name}" in ALLOW:
                        continue
                    hits.append((rel, ln, name))
    return files, hits


def main():
    base = os.path.expanduser(sys.argv[1] if len(sys.argv) > 1 else "~/wip")
    total_files, total_hits, absent = 0, [], []
    for r in REPOS:
        root = os.path.join(base, r)
        if not os.path.isdir(root):
            absent.append(r)
            continue
        n, hits = scan_repo(root)
        total_files += n
        for rel, ln, name in hits:
            total_hits.append(f"{r}/{rel}:{ln}  {name}")
    if absent:
        print(f"[synth_empty] — 没验(本机没有检出):{', '.join(absent)}", file=sys.stderr)
    # 🔴 扫到 0 个文件和"全都干净"在输出上一样,而前者是空跑。
    if total_files == 0:
        print("[synth_empty] — 没验:一个 .go 都没扫到,路径不对", file=sys.stderr)
        sys.exit(2)
    print(f"[synth_empty] 扫了 {total_files} 个 .go")
    if total_hits:
        print(f"[synth_empty] ❌ {len(total_hits)} 处「裸 string 变量无条件 proto.String」:")
        for h in total_hits:
            print("    " + h)
        print("    —— 它可能是空串,而空串在回包里是「有这个值,它是空的」。")
        print("       改成 *string:取到才 proto.String,取不到就留 nil。")
        sys.exit(1)
    print("[synth_empty] ✓ 没有凭空造空串的地方")


main()

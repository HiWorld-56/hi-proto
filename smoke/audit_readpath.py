#!/usr/bin/env python3
"""读路径体检:库里 NULL-able 的列,Go 模型是不是裸类型。

裸类型 = gorm 把 NULL 扫成零值 → 再被 proto.String()/Int64() 包成"存在且为空"
→ 调用方分不开"没有"和"是空的"。**迁移做到库里也会断在这一层。**

只报**库里真的有 NULL 行**的那些 —— 列可为空但一行 NULL 都没有,说明业务上它恒有值,
不是漏,是 DDL 松。
"""
import pathlib, re, json, subprocess, sys

ROOT = pathlib.Path.home() / "wip"
REPOS = {
    "backend-hi-did": "hi_did",
    "backend-hi-club": "hi_club",
    "backend-hi-ai": "hi_ai",
    "backend-hi-club-trade": "hi_club_trade",
}
# type Xxx struct { Field  Type  `gorm:"column:c;..."` }
STRUCT = re.compile(r"type\s+(\w+)\s+struct\s*\{(.*?)\n\}", re.S)
FIELD = re.compile(r"^\s*(\w+)\s+(\[\])?(\*)?([\w.]+)\s+`[^`]*gorm:\"([^\"]*)\"", re.M)
TABLE = re.compile(r"func\s*\((\w+)\)\s*TableName\(\)\s*string\s*\{\s*return\s+\"(\w+)\"")

def models(repo):
    """→ {表名: {列名: (结构体, 字段名, Go类型, 是否指针)}}"""
    out = {}
    for p in (ROOT / repo).rglob("*.go"):
        if "_test.go" in p.name or "/model/" not in str(p):
            continue
        txt = p.read_text(encoding="utf-8", errors="ignore")
        t2s = {m.group(1): m.group(2) for m in TABLE.finditer(txt)}
        for sm in STRUCT.finditer(txt):
            sname, body = sm.group(1), sm.group(2)
            tbl = t2s.get(sname)
            if not tbl:
                continue
            cols = {}
            for f in FIELD.finditer(body):
                fname, slice_, ptr, gotype, tag = f.groups()
                if slice_:
                    continue
                mcol = re.search(r"column:(\w+)", tag)
                if not mcol:
                    continue
                cols[mcol.group(1)] = (sname, fname, gotype, bool(ptr))
            if cols:
                out[tbl] = cols
    return out

allm = {}
for repo, db in REPOS.items():
    for tbl, cols in models(repo).items():
        allm[(db, tbl)] = (repo, cols)

print(json.dumps({f"{d}.{t}": {"repo": r, "cols": {c: v for c, v in cs.items()}}
                  for (d, t), (r, cs) in allm.items()}, ensure_ascii=False))

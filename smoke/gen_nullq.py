#!/usr/bin/env python3
"""生成一份 SQL:对每个「可为 NULL 且 Go 是裸类型」的列,数一下真有多少 NULL 行。"""
import json
import pathlib

d = json.load(open(pathlib.Path(__file__).with_name("models.json")))
parts = []
meta = []
for key, v in d.items():
    db, tbl = key.split(".", 1)
    for col, (sname, fname, gotype, is_ptr) in v["cols"].items():
        if is_ptr:
            continue  # 已经是指针,NULL 不会被摊平
        if gotype not in ("string", "int64", "int32", "uint32", "uint64", "float64", "bool", "int"):
            continue  # time.Time / 自定义类型另说
        parts.append(
            "select '%s|%s|%s|%s|%s' k, "
            "(select count(*) from `%s`.`%s`) total, "
            "(select count(*) from `%s`.`%s` where `%s` is null) nulls"
            % (db, tbl, col, sname + "." + fname, gotype, db, tbl, db, tbl, col)
        )
        meta.append((db, tbl, col, sname + "." + fname, gotype))

sql = "\nunion all\n".join(parts) + ";"
pathlib.Path("/tmp/nullcheck.sql").write_text(sql, encoding="utf-8")
print("生成 %d 条检查" % len(parts))

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""生成一份 SQL:**Go 侧是指针(可空)的列,库里不该有空串**。

## 为什么要有它 —— `gen_nullq.py` 的盲区正好在反方向

`gen_nullq.py` 按「列可为 NULL **且真有 NULL 行**」筛,漏掉的是
「**全是空串、一个 NULL 都没有**」那一类 —— 而那是更重的病:
说明**写入侧从来没写过 NULL**,迁移做到库里也白做。
(2026-08-29 就这么漏掉两张主用户表的头像,见 audit_readpath.md。)

这里换一个判据,不看库里现在有什么,看**模型怎么声明的**:

    Go 是 `*T`  =  这一列的语义是「可以没有值」
    → 那么「没有值」必须落成 NULL,库里出现空串就是**写入侧漏了一段**

它抓得住 `gen_nullq.py` 抓不住的两类:
  · `gorm:"default:''"` 挂在指针列上 —— gorm 把 nil **替换成空串**再写库
    (2026-09-02 实测:同一张表,带标签的列写出 "",不带的写出 NULL);
  · 内部函数拿 `""` 当哨兵,一路传到 `Updates` 的 map 里
    (`settle(ctx, g, "", "")` → grant.version / reason 全是空串)。

两个脚本是**一对**,都要跑:
    python3 audit_readpath.py > models.json
    python3 gen_nullq.py  && mysql -N -B < /tmp/nullcheck.sql  | awk -F'\\t' '$3+0>0'
    python3 gen_emptyq.py && mysql -N -B < /tmp/emptycheck.sql | awk -F'\\t' '$3+0>0'
"""
import json
import pathlib

d = json.load(open(pathlib.Path(__file__).with_name("models.json"), encoding="utf-8"))
parts = []
for key, v in d.items():
    db, tbl = key.split(".", 1)
    for col, (sname, fname, gotype, is_ptr) in v["cols"].items():
        if not is_ptr:
            continue          # 裸类型不表达"没有值",空串是不是脏数据要另判
        if gotype != "string":
            continue          # 只有字符串有"空串"这种伪零值;数值/bool 的另说
        parts.append(
            "select '%s|%s|%s|%s' k, "
            "(select count(*) from `%s`.`%s`) total, "
            "(select count(*) from `%s`.`%s` where `%s` = '') empties"
            % (db, tbl, col, sname + "." + fname, db, tbl, db, tbl, col)
        )

sql = "\nunion all\n".join(parts) + ";"
pathlib.Path("/tmp/emptycheck.sql").write_text(sql, encoding="utf-8")
print("生成 %d 条检查(指针型字符串列)" % len(parts))

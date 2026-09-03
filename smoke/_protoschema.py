#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把 protoc 吐出来的 FileDescriptorSet 文本解析成「消息 → 字段」的表。

## 为什么不用正则读 .proto

行式正则读 proto 不可信(漏过删字段、还发过版)。这里读的是 **protoc 自己**
生成的描述符文本 —— 它是编译器的输出,不是我们对语法的猜测。

生成方式(在 hi-proto 仓根):

    buf build -o /tmp/hi_fds.pb
    cd "$(protoc --version >/dev/null && dirname $(dirname $(which protoc)))/include" \\
      && protoc --decode=google.protobuf.FileDescriptorSet \\
                google/protobuf/descriptor.proto < /tmp/hi_fds.pb > /tmp/hi_fds.txt

## 给谁用

`empty_in_resp.py` —— 它要回答的是「**哪些字段从来没被真正观察过**」,
而不是「哪个接口没返回行」。空集合里没有元素,也就没有东西可验,那不是缺口;
真正的缺口是某个 `string` 字段在所有回包里**一次都没出现过**。
"""
import re
import sys


def parse(path):
    """→ (messages, services)

    messages: {"hi.club.Xxx": [(字段名, 类型, 子消息全名 or None, 是否 repeated), ...]}
    services: {"hi.club.Yyy.Method": "hi.club.ZzzResp"}
    """
    messages, services = {}, {}
    pkg = None
    # 用缩进栈跟踪 message 嵌套 —— protoc 的文本格式是花括号缩进的
    stack = []          # [(缩进, 名字)]
    cur_field = None
    cur_svc = None
    cur_method = None

    def full(name):
        return ".".join([pkg] + [n for _, n in stack] + [name]) if pkg else name

    for raw in open(path, encoding="utf-8", errors="ignore"):
        line = raw.rstrip("\n")
        ind = len(line) - len(line.lstrip())
        t = line.strip()

        if t.startswith("package: "):
            pkg = t.split('"')[1]
            stack = []
            continue
        # 出块:把比当前缩进深的都弹掉
        while stack and ind <= stack[-1][0]:
            stack.pop()

        m = re.match(r'^(message_type|nested_type) \{$', t)
        if m:
            stack.append((ind, None))   # 名字下一行才出现
            continue
        if t.startswith("name: ") and stack and stack[-1][1] is None:
            nm = t.split('"')[1]
            stack[-1] = (stack[-1][0], nm)
            messages.setdefault(full("")[:-1] if False else ".".join([pkg] + [n for _, n in stack if n]), [])
            continue

        if t == "field {":
            cur_field = {}
            continue
        if cur_field is not None:
            if t.startswith("name: "):
                cur_field["name"] = t.split('"')[1]
            elif t.startswith("label: "):
                cur_field["label"] = t.split(": ", 1)[1]
            elif t.startswith("type: "):
                cur_field["type"] = t.split(": ", 1)[1]
            elif t.startswith("type_name: "):
                cur_field["type_name"] = t.split('"')[1].lstrip(".")
            elif t == "}":
                owner = ".".join([pkg] + [n for _, n in stack if n])
                if owner and "name" in cur_field:
                    messages.setdefault(owner, []).append((
                        cur_field["name"],
                        cur_field.get("type", ""),
                        cur_field.get("type_name"),
                        cur_field.get("label") == "LABEL_REPEATED",
                    ))
                cur_field = None
            continue

        if t == "service {":
            cur_svc = None
            continue
        if t.startswith("name: ") and cur_svc is None and not stack:
            cur_svc = t.split('"')[1]
            continue
        if t == "method {":
            cur_method = {}
            continue
        if cur_method is not None:
            if t.startswith("name: "):
                cur_method["name"] = t.split('"')[1]
            elif t.startswith("output_type: "):
                cur_method["out"] = t.split('"')[1].lstrip(".")
            elif t == "}":
                if cur_svc and "name" in cur_method and "out" in cur_method:
                    services[f"{pkg}.{cur_svc}.{cur_method['name']}"] = cur_method["out"]
                cur_method = None
            continue
    return messages, services


def string_fields(messages, root, seen=None, path="", depth=0):
    """从 root 这个消息出发,列出所有可达的 `string` 字段。

    回 [(消息全名, 字段名, JSON 路径)]。JSON 路径用 camelCase —— protojson 就是那么出的。
    """
    if seen is None:
        seen = set()
    if root in seen or depth > 6 or root not in messages:
        return []
    seen = seen | {root}
    out = []
    for name, typ, tname, rep in messages[root]:
        jname = re.sub(r"_(\w)", lambda m: m.group(1).upper(), name)
        jp = (path + "." + jname).lstrip(".")
        if typ == "TYPE_STRING":
            out.append((root, name, jp))
        elif typ == "TYPE_MESSAGE" and tname:
            out += string_fields(messages, tname, seen, jp + ("[]" if rep else ""), depth + 1)
    return out


if __name__ == "__main__":
    ms, svcs = parse(sys.argv[1] if len(sys.argv) > 1 else "/tmp/hi_fds.txt")
    hi = {k: v for k, v in ms.items() if k.startswith("hi.")}
    print(f"解析到 {len(hi)} 个 hi.* 消息 / {len(svcs)} 个 rpc")
    if len(sys.argv) > 2:
        root = sys.argv[2]
        for m, f, jp in string_fields(ms, root):
            print(f"  {m}.{f}  ← {jp}")

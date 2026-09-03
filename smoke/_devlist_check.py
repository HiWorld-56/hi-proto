#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""smoke-lua.sh 的判据:下发清单里 LUA 与 RUST 的 target 各该长什么样。

从 stdin 读 `hi.club.AgentPlugin/ListOnDevice` 的回包,argv[1] 是请求时给的架构。

判据两条,**必须在同一份清单里同时成立**才说明筛法是对的:
  · LUA 条目的 `target` 是 `any` —— lua 制品与架构无关,一份通吃
  · RUST 条目的 `target` 等于请求的架构 —— 它是编出来的 .so,必须同架构

只验前一条是不够的:清单如果**根本没做架构筛选**,LUA 那条照样是 any(它本来就写死 any),
一片绿而 RUST 的 .so 可能正被发给错误的架构 —— 装上去就是加载失败。

退出码:0 = 两条都过;2 = LUA 过、但这台机器人身上没有 RUST 插件可比(没验);1 = 有违规。
"""
import json
import sys

G, R, Y, N = "\033[32m", "\033[31m", "\033[33m", "\033[0m"
arch = sys.argv[1] if len(sys.argv) > 1 else "x86_64"

try:
    items = json.load(sys.stdin).get("list", [])
except Exception as e:
    print(f"  {R}✗{N} 下发清单不是 JSON:{e}")
    sys.exit(1)

lua = [i for i in items if i.get("lang") == "PLUGIN_LANG_LUA"]
rust = [i for i in items if i.get("lang") == "PLUGIN_LANG_RUST"]

if not lua:
    print(f"  {R}✗{N} 清单里没有 LUA 条目 —— 机器人永远装不上它,而且没有任何报错")
    sys.exit(1)
bad_lua = [i.get("name") for i in lua if i.get("target") != "any"]
if bad_lua:
    print(f"  {R}✗{N} LUA 条目的 target 不是 any:{','.join(map(str, bad_lua))}")
    sys.exit(1)
print(f"  {G}✓{N} **LUA 条目的 target 是 any**(不跟架构走,一份通吃)")

if not rust:
    print(f"  {Y}—{N} 没验:这台机器人身上没有 RUST 插件,「按架构筛」这条没数据可比")
    sys.exit(2)
bad_rust = [i.get("name") for i in rust if i.get("target") != arch]
if bad_rust:
    print(f"  {R}✗{N} RUST 条目的 target 不是 {arch}:{','.join(map(str, bad_rust))}"
          f" —— 装到机器人上会加载失败")
    sys.exit(1)
print(f"  {G}✓{N} **RUST 条目按架构筛过**(target={arch},与 lua 的 any 在同一份清单里并存)")
sys.exit(0)

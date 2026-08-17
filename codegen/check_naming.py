#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CI 校验:请求/响应消息命名。

标准(TRON 式实用,不学 Google AIP 那样连 Empty 进出都造 Request):

  · 每方法的 DTO 命名 `<资源/服务><动词>Req|Resp` 或 `<动词><资源>Req|Resp`,
    一眼能看出属于哪个方法。
  · 共享领域对象(Entity/GroupBase/AuthToken/UserExtensionUnit…)和线材类型
    (SignedData/DID/RequestId…)照复用,**不**为每方法强造 DTO。

本 lint **不**强行套公式(那会对一堆合法名误报),只拦两类真实踩过的坏味道:

  1. `All` 冗余段 —— `ListAllTradeReq`(方法叫 List,名字却 ListAll*)。
     判据:消息的 All 段**没有**出现在使用它的方法名里。所以 `DeleteAllPluginVersionsReq`
     配 `DeleteAll` 是合法的(All 属于动词),`ListAllTradeReq` 配 `List` 才是坏味道。
     "全部 vs 我的" 的区分应由 service 表达(TradeManage vs Trade),不塞进消息名。
  2. 裸 `Manage`/`Admin` 前缀 —— `ManageListAgentsReq`。前缀应是**完整服务名**
     (`AgentManageListReq`),裸前缀谁都对不上。

要更严的公式化命名,靠 review 不靠 lint。
"""
import re, sys, glob, os

HIPROTO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
msg_re = re.compile(r'^message\s+(\w+)\s*\{')
rpc_re = re.compile(r'rpc\s+(\w+)\s*\(\s*(?:stream\s+)?([\w.]+)\s*\)\s*returns\s*\(\s*(?:stream\s+)?([\w.]+)\s*\)')

# 消息 → 用它的方法名(同名消息跨包也就那么回事,取任一使用者即可)
used_by = {}
for f in glob.glob(os.path.join(HIPROTO, 'hi', '**', '*.proto'), recursive=True):
    for line in open(f, encoding='utf-8'):
        m = rpc_re.search(line)
        if m:
            meth, req, resp = m.groups()
            used_by.setdefault(req.split('.')[-1], meth)
            used_by.setdefault(resp.split('.')[-1], meth)

bad = []
for f in sorted(glob.glob(os.path.join(HIPROTO, 'hi', '**', '*.proto'), recursive=True)):
    rel = os.path.relpath(f, HIPROTO)
    for i, line in enumerate(open(f, encoding='utf-8'), 1):
        m = msg_re.match(line)
        if not m:
            continue
        name = m.group(1)
        if not (name.endswith('Req') or name.endswith('Resp')):
            continue
        meth = used_by.get(name, '')
        # 1) All 冗余段:消息带 All,但使用它的方法名里没有 All
        if (re.search(r'All[A-Z]', name) or name.endswith('AllReq') or name.endswith('AllResp')) \
                and 'All' not in meth:
            bad.append((rel, i, name, f"带 All 冗余段(方法是 {meth or '?'},不含 All);区分交给 service 名"))
        # 2) 裸 Manage/Admin 前缀
        if re.match(r'(Manage|Admin)[A-Z]', name):
            bad.append((rel, i, name, "裸 Manage/Admin 前缀;应是完整服务名如 <X>ManageListReq"))

if bad:
    print("[check_naming] ✗ 请求/响应命名坏味道:")
    for rel, i, name, why in bad:
        print(f"    {rel}:{i}  {name} —— {why}")
    sys.exit(1)
print("[check_naming] ✓ 未见 All 冗余 / 裸 Manage 前缀")

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""给 hi_coin 补 chain/contract/decimals,**decimals 一律从链上读回来写**。

⚠️ 不手填 decimals:配错不报错,只是金额差数量级(多一位少付十倍,少一位多付十倍),
   而且链上不可撤销。同一个符号在不同链上小数位可以不同,照抄经验值迟早出事。

用法:seed_coins.py [--apply]   不带 --apply 只打印要做什么
"""
import json, subprocess, sys, urllib.request

NODE = "https://fullnode.mainnet.aptoslabs.com/v1"

# 待补的 Aptos FA。**只给合约地址,decimals 留空由链上取**。
APTOS_FA = [
    "0xa0c052785d0b0e221a074eaebd6f1049a06268381b2b8a766746e71618a060e6",
    "0xae7f9b9c327b9e982785d6d442fa4f97e1dfd5270345d6e9d79e6667af47b7fd",
    "0xb08e5cfa0166a8500df855671bc157eca0c3bd8e2a674e5507447da164d7444d",
    "0x8fd92c53b47bdc68e922a4873e5c6cdcb01c0ef8c22ce523ebe00b414f444ef2",
]

# 已有的原生币:只补 chain,contract 空,decimals 是链本身的常量(不是合约的,无需上链问)。
NATIVE = {
    "BTC": ("btc", 8), "ETH": ("eth", 18), "TRX": ("trx", 6),
    "SOL": ("sol", 9), "APT": ("aptos", 8), "APTOS": ("aptos", 8),
}


def view(fn, arg):
    body = json.dumps({"function": f"0x1::fungible_asset::{fn}",
                       "type_arguments": ["0x1::fungible_asset::Metadata"],
                       "arguments": [arg]}).encode()
    req = urllib.request.Request(NODE + "/view", data=body,
                                 headers={"Content-Type": "application/json"})
    return json.load(urllib.request.urlopen(req, timeout=20))[0]


def q(sql):
    return subprocess.run(["mysql", "-h127.0.0.1", "-ulo", "-p568568", "hi_did", "-N", "-e", sql],
                          capture_output=True, text=True).stdout.strip()


def main():
    apply = "--apply" in sys.argv
    print("── 从链上读 Aptos FA 元数据 ──")
    rows = []
    for addr in APTOS_FA:
        sym, dec = view("symbol", addr), int(view("decimals", addr))
        # 后缀沿用**库里已有的写法** `-APT`(不是 -APTOS)。
        # 这四个币在 hi_coin 里早就有行了,只是没配 chain/contract/decimals ——
        # 新建一份 -APTOS 会让 app 的币种列表里出现两个一模一样的币。
        name = f"{sym}-APT"
        rows.append((name, "aptos", addr, dec))
        print(f"  {sym:6s} decimals={dec}  {addr}")

    print("\n── 已有原生币:补 chain(decimals 是链常量)──")
    for name, (chain, dec) in NATIVE.items():
        if q(f"SELECT COUNT(*) FROM hi_coin WHERE name='{name}' AND deleted_at IS NULL") == "1":
            rows.append((name, chain, "", dec))
            print(f"  {name:6s} chain={chain} decimals={dec}")

    print("\n── 还缺 chain 的(合约币,合约地址得人工确认后再补)──")
    left = q("SELECT name FROM hi_coin WHERE (chain IS NULL OR chain='') AND deleted_at IS NULL")
    for n in [x for x in left.split("\n") if x and not any(x == r[0] for r in rows)]:
        print(f"  ⚠️ {n} —— 没配 chain/contract,机器人付不了它")

    if not apply:
        print("\n(未加 --apply,以上只是预览)")
        return
    print("\n── 写入 ──")
    for name, chain, contract, dec in rows:
        if q(f"SELECT COUNT(*) FROM hi_coin WHERE name='{name}' AND deleted_at IS NULL") == "1":
            q(f"UPDATE hi_coin SET chain='{chain}', contract='{contract}', decimals={dec} WHERE name='{name}'")
            print(f"  更新 {name}")
        else:
            q("INSERT INTO hi_coin (name,icon,category,chain,contract,decimals,created_at,updated_at) "
              f"VALUES ('{name}','','custom','{chain}','{contract}',{dec},NOW(),NOW())")
            print(f"  新增 {name}")


if __name__ == "__main__":
    main()

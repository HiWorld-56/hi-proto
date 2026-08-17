#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把 hidid 硬编码的币种表灌进 hi_coin,并**逐行比对**。

⚠️ 这是"两份变一份"之前的必经一步:切换数据源之前,新源必须先与旧源**完全一致**,
   否则切过去就是把不完整/不一致的那份变成唯一真相 —— 而且不会报错,
   只会在某次转账时金额或合约对不上。

用法:coin_sync.py            只比对并打印差异
     coin_sync.py --apply    把缺的补进库(**只补,不覆盖已有的非空值**)
"""
import subprocess, sys

# 直接抄自 backend-hi-did/internal/common/web3.go —— 这是切换前的**旧真相**。
HARDCODED = {
    # name:            (chain,   contract,                                     decimals)
    "BTC":        ("btc",   "",                                             8),
    "ETH":        ("eth",   "",                                             18),
    "USDT-ERC20": ("eth",   "0xdac17f958d2ee523a2206206994597c13d831ec7",   6),
    "TRX":        ("trx",   "",                                             6),
    "USDT-TRC20": ("trx",   "TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t",           6),
    "WHDS-TRC20": ("trx",   "TKRAuRHUV4kVLnxRsWU5y7Hn9qGZR5zzkY",           6),
    "BT-TRC20":   ("trx",   "TAqekjAWmKwKDaw6JCAKoVCX1okkKzbn85",           6),
    "SOL":        ("sol",   "",                                             9),
    "USDT-SOL":   ("sol",   "Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB", 6),
    "BT-SOL":     ("sol",   "ADJfHNBtUbQ8Djj7JBgiLBLtmFpP21F3BNjv4pEZkQy4", 6),
    # ⚠️ 常量名叫 COIN_NAME_PANDASOL,但它的**值**是 "PANDA" —— 与库里那行一致。
    #    差点因为看常量名而误判成不一致:名字会骗人,值不会。
    "PANDA":      ("sol",   "EYaZ24rxKymH6xS8RmR8D9SthNnLGR25MveqxyseVJq5", 6),
    "APT":        ("aptos", "",                                             8),
    "HWHD-APT":   ("aptos", "0xa0c052785d0b0e221a074eaebd6f1049a06268381b2b8a766746e71618a060e6", 8),
    "SLKJ-APT":   ("aptos", "0xae7f9b9c327b9e982785d6d442fa4f97e1dfd5270345d6e9d79e6667af47b7fd", 8),
    "WHDS-APT":   ("aptos", "0xb08e5cfa0166a8500df855671bc157eca0c3bd8e2a674e5507447da164d7444d", 8),
    "WSM-APT":    ("aptos", "0x8fd92c53b47bdc68e922a4873e5c6cdcb01c0ef8c22ce523ebe00b414f444ef2", 8),
}


def q(sql):
    return subprocess.run(["mysql", "-h127.0.0.1", "-ulo", "-p568568", "hi_did", "-N", "-e", sql],
                          capture_output=True, text=True).stdout.strip()


def db_table():
    out = q("SELECT name,chain,contract,decimals FROM hi_coin WHERE deleted_at IS NULL")
    d = {}
    for line in out.split("\n"):
        if not line.strip():
            continue
        f = line.split("\t")
        d[f[0]] = (f[1], f[2], int(f[3]))
    return d


def main():
    apply = "--apply" in sys.argv
    db = db_table()
    missing, diff, ok = [], [], 0

    for name, want in HARDCODED.items():
        got = db.get(name)
        if got is None:
            missing.append((name, want, "库里没有这个币种"))
        elif got == ("", "", 0) or (got[0] == "" and got[2] == 0):
            missing.append((name, want, "库里有行但没配链信息"))
        elif got != want:
            diff.append((name, want, got))
        else:
            ok += 1

    print(f"── 一致 {ok} / {len(HARDCODED)} ──")
    if missing:
        print(f"\n── 待补 {len(missing)} ──")
        for n, w, why in missing:
            print(f"  {n:12s} {why} → chain={w[0]} decimals={w[2]} {w[1][:24]}")
    if diff:
        print(f"\n── ⚠️ **不一致 {len(diff)}**(切换前必须弄清哪边对)──")
        for n, w, g in diff:
            print(f"  {n:12s} 硬编码={w}")
            print(f"  {'':12s} 库    ={g}")

    # 库里有、硬编码没有的:切换后它们仍然可用(库是新的唯一真相),但值得看一眼
    extra = [n for n in db if n not in HARDCODED and db[n][0]]
    if extra:
        print(f"\n── 库里多出来的(硬编码没有,切换后依然可用)── {extra}")

    if not apply:
        print("\n(未加 --apply,以上只是比对)")
        return 1 if diff else 0

    if diff:
        print("\n❌ **有不一致,拒绝写入** —— 先人工确认哪边对。")
        return 1
    for name, (chain, contract, dec) in missing and [(n, w) for n, w, _ in missing] or []:
        pass
    for name, want, _ in missing:
        chain, contract, dec = want
        if name in db:
            q(f"UPDATE hi_coin SET chain='{chain}', contract='{contract}', decimals={dec} WHERE name='{name}' AND deleted_at IS NULL")
            print(f"  补 {name}")
        else:
            q("INSERT INTO hi_coin (name,icon,category,chain,contract,decimals,created_at,updated_at) "
              f"VALUES ('{name}','','public','{chain}','{contract}',{dec},NOW(),NOW())")
            print(f"  新增 {name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())

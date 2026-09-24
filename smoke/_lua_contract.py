# -*- coding: utf-8 -*-
"""lua 测试包该写几号契约 —— **问构建服务**,不在这里写数字。

契约号只在 hinj-plugin-sdk 里定义(`LUA_CONTRACT`);构建服务的 verify-lua 编进去的就是它,
`verify-lua --contract` 报出来的号,与 brain 装载时认的号是同一个定义(两边钉同一个 SDK 号时)。
原来这里写死一个数:2026-09-20 宿主升到 2,这里没跟,包全被机器人拒载。

问不到就**退出码 2**(= 没验),不猜一个号 —— 猜错了跑出来的红看着像 lua 链坏了。
"""
import os
import subprocess
import sys

BUILDER_HOST = os.environ.get("BUILDER_HOST", "192.168.1.66")  # 开发环境的构建服务只在 .66


def host_contract() -> int:
    cmd = ["ssh", "-n", "-o", "ConnectTimeout=10", BUILDER_HOST,
           "docker exec hi-plugin-build /opt/hinj/verify-lua --contract"]
    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
    except Exception as e:  # noqa: BLE001 —— 连 ssh 都没跑起来
        why = str(e)
    else:
        if r.returncode == 0 and r.stdout.strip().isdigit():
            return int(r.stdout.strip())
        why = (r.stderr.strip().splitlines() or [f"回的是 {r.stdout.strip()!r}"])[-1]
    print(f"问不到构建服务的 lua 契约号({BUILDER_HOST}):{why}", file=sys.stderr)
    sys.exit(2)

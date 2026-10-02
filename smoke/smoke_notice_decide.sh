#!/bin/bash
# smoke_notice_decide.py 的壳:收尾机制(made / undo → 退出时统一做)在 _endpoints.sh,python 只往清单里登记。
# 用法:SELLER_TOK=... BUYER_TOK=... [PKG=<测试插件包 url>] bash smoke_notice_decide.sh
#      PKG 不给就现造一个,退出时删掉;给了是调用方的,本脚本不删。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"
: "${SELLER_TOK:?需要卖家 token}" "${BUYER_TOK:?需要买家 token}"
[ -n "${PKG:-}" ] || PKG=$(pkg_build build_testpkg.py) || { echo "造测试插件包失败"; exit 1; }
PKG="$PKG" python3 "$(dirname "$0")/smoke_notice_decide.py" "$@"

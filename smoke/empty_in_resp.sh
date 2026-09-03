#!/bin/bash
# empty_in_resp.py 的壳:_endpoints.sh 里有 CA 证书与三个网关地址的解析(bash),
# 判据本身在 .py 里。用法:CLUB_TOKEN=... bash empty_in_resp.sh
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"
CAC="$CAC" CLUB_API="$CLUB_API" AI_API="$AI_API" DID_API="$DID_API" \
  python3 "$(dirname "$0")/empty_in_resp.py" "$@"

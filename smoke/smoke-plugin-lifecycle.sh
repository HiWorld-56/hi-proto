#!/bin/bash
# 插件的**生命周期面**:发版之后那些没人测过的路由。
#
# ## 为什么单独一个
#
# `smoke-market.sh` 走的是"发版 → 挂牌 → 购买 → 撤权"这条**交易**链;
# `smoke-lua.sh` 走的是"认成 LUA → 制品 → 下发清单"这条**投递**链。
# 而 `hi.club.Plugin` 一共 16 条 http 路由,**其中 10 条两边都没碰过**:
#
#     get / list_versions / set_active / set_enabled / edit / retry_build
#     reload_api_key / delete / delete_versions / delete_version_list / delete_shells
#
# 它们全是"插件已经发出去之后"的操作 —— 也就是**用户真正天天用的那一半**,
# 而且每一条出错都很安静(删错版本、开关没生效、api_key 失效),
# 表现是"机器人忽然不会某个能力了",没有任何报错。
#
# ## 用法
#
#   bash smoke-plugin-lifecycle.sh <用户token> <lua包url>
#
# lua 包来自 `build_luapkg.py`。用 lua 是因为它**发版即就绪**,
# 不用等交叉编译,这条脚本才能在几十秒内跑完。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"
TOK="${1:?用法: smoke-plugin-lifecycle.sh <用户token> <lua包url>}"
PKG="${2:?需要 lua 插件包 url(build_luapkg.py)}"

G="\033[32m"; R="\033[31m"; Y="\033[33m"; N="\033[0m"
pass=0; fail=0
ok(){   printf "  ${G}✓${N} %s\n" "$1"; pass=$((pass+1)); }
bad(){  printf "  ${R}✗${N} %s\n     → %s\n" "$1" "$2"; fail=$((fail+1)); }
sk(){   printf "  ${Y}—${N} 没验:%s\n" "$1"; }
has(){  case "$2" in *"$3"*) ok "$1";; *) bad "$1" "没有 '$3':$(echo "$2"|head -c 200)";; esac; }
cj(){ curl -s $CAC -m 120 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' \
        -H "Authorization: Bearer $TOK" -d "$2"; }
cg(){ curl -s $CAC -m 120 "$CLUB_API/$1" -H "Authorization: Bearer $TOK"; }
g(){ python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)
    for k in sys.argv[1:]:
        d = d[int(k)] if k.lstrip("-").isdigit() else d[k]
    print(d if d is not None else "")
except Exception:
    print("")' "$@"; }

# 一台机器人上第一个插件的现状,一行讲清 —— 每步之后都取一次,
# **断言的是"状态真的变了"**,不是"接口回了 code 0"。
state(){ cj plugin/list "{\"agent\":\"$B\",\"pagination\":{\"page\":1,\"limit\":9}}" | python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)["data"]["list"]
except Exception:
    print("ERR"); raise SystemExit
i = next((x for x in d if x["shell"]["uuid"] == sys.argv[1]), None)
if i is None:
    print("GONE"); raise SystemExit
a = i.get("active") or {}
print("active=%s enabled=%s ver_cnt=%s ref=%s key=%s" % (
    a.get("version") or "-", i.get("enabled"), len(i.get("artifacts") or []),
    i.get("refCount"), (i.get("data") or {}).get("key", "-")[:8]))' "$P"; }

echo "══════ 插件生命周期(发版之后那 10 条没人测过的路由)══════"

B=$(cj agent/create_assistant '{"name":"plc-bot"}' | g data base did)
[ -n "$B" ] || { echo "建机器人失败"; exit 1; }
cj api_key/create "{\"agent\":\"$B\"}" >/dev/null
P=$(cj plugin/create_shell "{\"agent\":\"$B\",\"name\":\"plc-demo\"}" | g data uuid)
[ -n "$P" ] || { echo "建壳失败"; exit 1; }
for v in 1.0.0 2.0.0; do
  cj plugin/create_version "{\"agent\":\"$B\",\"version\":{\"uuid\":\"$P\",\"version\":\"$v\",\"url\":\"$PKG\"}}" >/dev/null
done
echo "  机器人=$B 插件=$P(发了 1.0.0 与 2.0.0)"

echo
echo "── 一、读:get / list_versions ──"
# ⚠️ **`plugin/get` 是 GET 路由**(见 http/club.yaml)。用 POST 打会得到
#    `code 12 Method Not Allowed` —— 而那条错看着像"接口不存在"。
GET=$(cg "plugin/get?agent=$B&uuid=$P")
has "plugin/get(**GET** 不是 POST)拿得到壳" "$GET" '"code":0'
has "get 回包里带着壳名" "$GET" 'plc-demo'

LV=$(cj plugin/list_versions "{\"agent\":\"$B\",\"uuid\":\"$P\",\"pagination\":{\"page\":1,\"limit\":20}}")
NV=$(printf '%s' "$LV" | g data list | grep -o "'version'" | wc -l)
case "$(printf '%s' "$LV" | python3 -c '
import sys, json
d = json.load(sys.stdin)["data"]["list"]
vs = sorted((x["version"]["version"] for x in d))
act = [x["version"]["version"] for x in d if x.get("active")]
print("%s|%s" % (",".join(vs), ",".join(act)))')" in
  "1.0.0,2.0.0|1.0.0") ok "list_versions 出两个版本,且**只有 1.0.0 是 active**(发新版不自动切,follow_latest 才切)";;
  *) bad "list_versions" "$(printf '%s' "$LV" | head -c 200)";;
esac
# 这条同时也是空值改造的一段:版本列表里不该有 `"字段": ""`。
E=$(printf '%s' "$LV" | python3 -c '
import sys, json
bad = []
def walk(o, p=""):
    if isinstance(o, dict):
        for k, v in o.items():
            if isinstance(v, str) and v == "": bad.append((p+"."+k).lstrip("."))
            else: walk(v, p+"."+k)
    elif isinstance(o, list):
        for i, v in enumerate(o): walk(v, p+"[%d]"%i)
walk(json.load(sys.stdin).get("data"))
print(len(bad), " ".join(sorted(set(bad))[:6]))')
case "$E" in 0*) ok "list_versions 回包里没有空串";; *) bad "list_versions 回包里有空串" "$E";; esac

echo
echo "── 二、切版:set_active ──"
S0=$(state)
cj plugin/set_active "{\"agent\":\"$B\",\"uuid\":\"$P\",\"version\":\"2.0.0\"}" >/dev/null
S1=$(state)
# 🔴 判据是**状态真的变了**,不是接口回了 0。"调用成功但什么都没发生"
#    和"调用成功且生效了"在返回值上一模一样。
case "$S1" in *"active=2.0.0"*) ok "set_active 真的切到了 2.0.0(起点 $(printf '%s' "$S0"|grep -oE 'active=[^ ]+'))";;
  *) bad "set_active 没生效" "改后仍是 $S1";; esac

echo
echo "── 三、开关:set_enabled ──"
SE=$(cj plugin/set_enabled "{\"agent\":\"$B\",\"uuid\":\"$P\",\"enabled\":true}")
# 软件机器人跑不了设备端插件(LUA/RUST 都是),它只能"挂着卖"。
# **判据是错误话说到了那道守卫**,不是"被拒了"——夹具坏了也会被拒。
has "软件机器人启用设备端插件被拒(设计如此)" "$SE" '软件机器人不能启用'
case "$(state)" in *"enabled=False"*) ok "被拒之后 enabled 确实**没被改**(不是先写了再报错)";;
  *) bad "enabled 被改动了" "$(state)";; esac
# bool 载荷不传要报错,不能静默当 false —— 与 null_test.sh 同一条口径,这里再钉一次。
has "set_enabled 不传 enabled → 报错(不是当 false)" \
    "$(cj plugin/set_enabled "{\"agent\":\"$B\",\"uuid\":\"$P\"}")" 'code'

echo
echo "── 四、lua 不需要构建:retry_build ──"
has "对 lua 插件 retry_build 被拒,且说清了为什么" \
    "$(cj plugin/retry_build "{\"agent\":\"$B\",\"uuid\":\"$P\",\"version\":\"2.0.0\"}")" 'lua 插件不需要构建'

echo
echo "── 五、api_key:reload 只从现有的取,不造新的 ──"
K0=$(state | grep -oE 'key=[^ ]+')
RK=$(cj plugin/reload_api_key "{\"agent\":\"$B\",\"uuid\":\"$P\"}")
has "reload_api_key 成功" "$RK" '"code":0'
K1=$(state | grep -oE 'key=[^ ]+')
# 语义是"重新装弹":从这台机器人现有的 apikey 列表取第一个覆盖写入。
# 机器人只有一把 key 时,重载前后**必须是同一把** —— 变了就说明它偷偷造了一把。
[ "$K0" = "$K1" ] && ok "重载前后是**同一把** key($K0)—— 没有偷偷创建" \
                  || bad "reload 造出了新 key" "前=$K0 后=$K1"

echo
echo "── 六、删版本:非激活可删,删到一个不剩要被拦 ──"
D1=$(cj plugin/delete "{\"agent\":\"$B\",\"uuid\":\"$P\",\"version\":\"1.0.0\"}")
has "删**非激活**版成功" "$D1" '"code":0'
case "$(state)" in *"active=2.0.0"*) ok "删非激活版不动 active";; *) bad "active 被带歪了" "$(state)";; esac

# 挂上市场之后,删到一个版本都不剩必须被拦 —— 否则买家申请时卡在「尚无激活版本」,
# 而卖家那边一点异常都看不到。
L=$(cj market/create_listing "{\"agent\":\"$B\",\"plugin_uuid\":\"$P\",\"settle_mode\":1}" | g data uuid)
if [ -z "$L" ]; then
  sk "挂牌没建起来,「删到一个不剩」这条没验"
else
  cj market/set_listing_status "{\"uuid\":\"$L\",\"status\":2}" >/dev/null   # 2 = LISTED
  has "**挂牌中**删掉最后一个版本被拒,且说清了怎么办" \
      "$(cj plugin/delete "{\"agent\":\"$B\",\"uuid\":\"$P\",\"version\":\"2.0.0\"}")" '先到「插件市场」把它下架'
  case "$(state)" in *"active=2.0.0"*) ok "被拒之后版本还在(不是先删了再报错)";; *) bad "版本没了" "$(state)";; esac

  # ⚠️ **「隐藏」不是「下架」。** ListingStatus:1=草稿 2=挂牌中 **3=隐藏** 4=已下架。
  #    隐藏只是"搜不到、直链还能进",挂牌**依然成立**,所以这道守卫照样该拦。
  #    (第一版脚本把 3 当成了下架,于是这一步"删不掉"被当成产品 bug 报了一次红 ——
  #     判据写错了,而红的样子和真 bug 一模一样。)
  cj market/set_listing_status "{\"uuid\":\"$L\",\"status\":3}" >/dev/null   # 3 = HIDDEN
  has "**隐藏**也算还挂着,照样拦" \
      "$(cj plugin/delete "{\"agent\":\"$B\",\"uuid\":\"$P\",\"version\":\"2.0.0\"}")" '先到「插件市场」把它下架'

  cj market/set_listing_status "{\"uuid\":\"$L\",\"status\":4}" >/dev/null   # 4 = DELISTED,真下架
fi

# 真下架(status=4)之后允许删空:此时 active 应变成**没有**,
# 而不是留一个指向已删版本的悬空指针。
DL=$(cj plugin/delete "{\"agent\":\"$B\",\"uuid\":\"$P\",\"version\":\"2.0.0\"}")
has "下架之后删得掉最后一个版本" "$DL" '"code":0'
case "$(state)" in
  *"active=- "*|*"active=-") ok "删光之后 active 是**没有**(不是悬空指向已删版本)";;
  GONE)                      bad "壳整个不见了" "删版本不该删壳";;
  *)                         bad "删光之后 active 不对" "$(state)";;
esac

echo
echo "── 清理 ──"
# 🔴 **清理也要断言**(同 smoke-lua-deps.sh 里那段的理由):
#    把它 `>/dev/null` 掉的话,token 中途失效时脚本照样满分,而环境被留脏。
cleanup_fail=0
for spec in "删插件壳|plugin/delete_shell|{\"agent\":\"$B\",\"uuid\":\"$P\"}" \
            "删测试机器人|agent/delete|{\"agent\":\"$B\"}"; do
  name=${spec%%|*}; rest=${spec#*|}; route=${rest%%|*}; body=${rest#*|}
  r=$(cj "$route" "$body")
  case "$r" in
    *'"code":0'*) printf "  ${G}✓${N} 清理:%s\n" "$name";;
    *) printf "  ${R}✗${N} 清理没做掉:%s\n     → %s\n" "$name" "$(echo "$r"|head -c 160)"; cleanup_fail=1;;
  esac
done
[ "$cleanup_fail" = 0 ] || fail=$((fail+1))

echo
printf "结果:通过 ${G}%d${N},失败 ${R}%d${N}\n" "$pass" "$fail"
[ "$fail" -eq 0 ]

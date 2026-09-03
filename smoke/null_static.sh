#!/bin/bash
# 「空值改造」的**两道静态闸**,一条命令跑完,并且**先证明查询真的跑了**。
#
# ## 为什么要有这个壳
#
# `gen_nullq.py` / `gen_emptyq.py` 把 SQL 写到 `/tmp/*.sql`,**stdout 只印一句
# 「生成 N 条检查」**。手敲的人很容易写成:
#
#     python3 gen_nullq.py > /tmp/nq.sql && mysql ... "$(cat /tmp/nq.sql)"
#
# 于是喂给 mysql 的是那句中文提示,MariaDB 报 1064,而**错误被 mysqlq 吞掉**
# (它带 `2>/dev/null`)—— 输出是空的,过滤器一筛,一片干净。
# **那是假绿:两道闸各扫了 0 列。** 2026-09-03 真踩到,差点当成"改造已经完成"。
#
# 所以这里每一步都断言**回了多少行**,行数为 0 一律当失败。
# (同一条教训:断言先证明自己的前提。)
set -uo pipefail
cd "$(dirname "$0")"
source ./_endpoints.sh

G="\033[32m"; R="\033[31m"; Y="\033[33m"; N="\033[0m"
fail=0

have_db || { echo "够不着 mysql(本机没装时会 ssh 到 $DB 去查,检查那条路)" >&2; exit 2; }

echo "── 0. 从各仓源码现抽模型(models.json)──"
python3 audit_readpath.py > models.json || { echo "audit_readpath.py 失败"; exit 2; }
COLS=$(python3 -c 'import json;d=json.load(open("models.json"));print(sum(len(v["cols"]) for v in d.values()))')
TBL=$(python3 -c 'import json;print(len(json.load(open("models.json"))))')
[ "${COLS:-0}" -gt 0 ] || { echo "models.json 里一列都没有 —— 多半是 ~/wip 下没检出后端仓,没验"; exit 2; }
printf "  ${G}✓${N} 抽到 %s 张表 / %s 列\n" "$TBL" "$COLS"

run(){ # run <标题> <生成脚本> <sql 路径> <违规怎么念>
  local title=$1 gen=$2 sqlf=$3 word=$4
  echo
  echo "── $title ──"
  local n; n=$(python3 "$gen" | grep -oE '[0-9]+' | head -1)
  [ "${n:-0}" -gt 0 ] || { printf "  ${R}✗${N} %s 一条检查都没生成\n" "$gen"; fail=$((fail+1)); return; }
  local out; out=$(mysqlq information_schema "$(cat "$sqlf")")
  local rows; rows=$(printf '%s' "$out" | grep -c . )
  # 🔴 **行数必须等于检查数。** 少了就是 SQL 报错被吞了(mysqlq 带 2>/dev/null),
  #    而那时过滤器筛出来是空的 —— 与"全部干净"长得一模一样。
  if [ "$rows" != "$n" ]; then
    printf "  ${R}✗${N} 生成 %s 条检查,只回了 %s 行 —— 查询没跑通,**这一闸没验**\n" "$n" "$rows"
    fail=$((fail+1)); return
  fi
  local bad; bad=$(printf '%s\n' "$out" | awk -F'\t' '$3+0>0 {printf "      ⛔ %s  总 %s 行,'"$word"' %s 行\n", $1, $2, $3}')
  if [ -n "$bad" ]; then
    printf "  ${R}✗${N} %s 条检查里有违规:\n%s\n" "$n" "$bad"
    fail=$((fail+1))
  else
    printf "  ${G}✓${N} %s 条检查全过\n" "$n"
  fi
}

run "1. 库里有 NULL、而 Go 是裸类型(读路径会把 NULL 摊平)" \
    gen_nullq.py /tmp/nullcheck.sql "NULL"
run "2. Go 是指针、而库里有空串(写入侧从来没写过 NULL)" \
    gen_emptyq.py /tmp/emptycheck.sql "空串"

# ── 3. 表覆盖对账 ────────────────────────────────────────────────────────────
#
# 上面两道扫的是 **models.json 里有的表**,而那份映射是靠源码里的 `TableName()`
# 建起来的 —— **没写 TableName() 的模型整张表都看不见,而且一声不响**。
# (`UserRemarkModel` 就是这样:它自己的注释里都写着"2026-08-30 就这么漏过一轮"。)
#
# 所以反过来对一次账:库里每张表,models.json 里有没有。多出来的要么是死表、
# 要么是漏掉的模型,两种都得有人看一眼 —— 不能继续静默。
echo
echo "── 3. 表覆盖对账:库里的表,审计都看得见吗 ──"
# 允许缺席的,**每条写清为什么**:
#   gorp_migrations              迁移账本,没有 Go 模型
#   v_*                          视图
#   DBUserInformationExtension_* 每个商户一张的动态表,没有静态模型
#   hi_dids / hi_ai_dids / hi_chat_user_remark
#                                死表(无代码引用;hi_chat_user_remark 的存储已搬到
#                                hi_chat_relation_remark,模型只剩一个适配用的 DTO)
IGNORE='^(gorp_migrations|v_.*|DBUserInformationExtension_.*|hi_dids|hi_ai_dids|hi_chat_user_remark)$'
missing=0
for pair in "hi_did" "hi_club" "hi_ai" "hi_club_trade"; do
  mysqlq information_schema "select table_name from tables where table_schema='$pair'" | sort > /tmp/_db.txt
  python3 -c "
import json
d = json.load(open('models.json'))
print('\n'.join(sorted(k.split('.', 1)[1] for k in d if k.startswith('$pair.'))))" | sort > /tmp/_mj.txt
  extra=$(comm -23 /tmp/_db.txt /tmp/_mj.txt | grep -Ev "$IGNORE")
  if [ -n "$extra" ]; then
    printf "  ${R}✗${N} %s 有表没进审计(要么补 TableName(),要么进上面的豁免名单并写明理由):\n" "$pair"
    printf '      %s\n' $extra
    missing=1
  fi
done
[ "$missing" = 0 ] && printf "  ${G}✓${N} 四个库的表,审计全都看得见(豁免的已列名并写明理由)\n" || fail=$((fail+1))

# ── 4. SQL 里不许把 NULL 摊平 ───────────────────────────────────────────────
#
# 这一条是 2026-09-03 现挖出来的:库里干净、Go 也是指针,两道静态闸全绿,
# 而客户端收到 92 个空串 —— 真因是查询里一句 `COALESCE(b.logo,'') AS logo`,
# presence 在**库和 Go 之间**就没了。两道闸看的是两头,看不见中间这一手。
echo
echo "── 4. SQL 里不许 COALESCE/IFNULL 成空串 ──"
#
# 两类要分开,判据是**这段 SQL 还会不会再跑**:
#   · `.go` 里的查询 —— 每次请求都在跑,**一律红**。
#   · `sql/` 下那些一次性脚本 —— 迁移当时把 NULL 写成了空串,已经发生过了;
#     再跑一遍才会重新腐蚀,所以只提醒,并让人确认它不在本轮发版清单里。
#
# ⚠️ 注释行要排除:讲"不许 COALESCE(x,'')"的注释本身会被自己抓到(实测过)。
NOCOMMENT="^[^:]+:[0-9]+:[[:space:]]*(//|--|#|\*)"
gohits=$(cd "$HOME/wip" && grep -rnE "(COALESCE|IFNULL)\([^)]*,[[:space:]]*''\)" --include=*.go \
          backend-hi-did backend-hi-club backend-hi-ai backend-hi-club-trade \
          backend-hi-source backend-hi-ai-plugin 2>/dev/null \
        | grep -v "_test.go" | grep -Ev "$NOCOMMENT")
sqlhits=$(cd "$HOME/wip" && grep -rlE "(COALESCE|IFNULL)\([^)]*,[[:space:]]*''\)" --include=*.sql \
          backend-hi-did backend-hi-club backend-hi-ai backend-hi-club-trade \
          backend-hi-source backend-hi-ai-plugin 2>/dev/null)
if [ -n "$gohits" ]; then
  printf "  ${R}✗${N} 活代码里有把 NULL 摊成空串的查询:\n"
  printf '      %s\n' "$gohits"
  fail=$((fail+1))
else
  printf "  ${G}✓${N} 六个后端的 .go 里没有 COALESCE(x,'')\n"
fi
if [ -n "$sqlhits" ]; then
  printf "  ${Y}—${N} 一次性脚本里有(已跑过的迁移,不算红)——**确认它们不在本轮发版清单里**:\n"
  printf '      %s\n' $sqlhits
fi

echo
if [ "$fail" -eq 0 ]; then
  printf "${G}两道静态闸都过了。${N}注意它们**都看不见 SQL 里的 COALESCE**\n"
  printf "(库和 Go 两头都对,中间一句 \`COALESCE(x,'')\` 照样把 presence 毁掉)——\n"
  printf "最后一道是 empty_in_resp.sh,端到端数回包。\n"
else
  printf "${R}%d 道闸没过。${N}\n" "$fail"
fi
exit $((fail > 0))

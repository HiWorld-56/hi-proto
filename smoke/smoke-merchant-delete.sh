#!/bin/bash
# 超管删商户(hi.did.MerchantManage/Delete)的回归。
#
# 为什么单独一个脚本:这条路**没有任何自动化覆盖**,而它一次删三样东西
# (扩展表 DDL / redis 关联 / 商户行 + 授权行),错了全是静默的。
# 2026-09-03 实测挖出三个,都在这里钉住:
#
#   ① 授权行(hi_merchant_grant)根本没人清。商户删了,两个方向的授权行都还在且
#      deleted_at 为 NULL。IsGranted 只查这张表、不看商户存不存在 —— 同一个 did
#      日后经邀请码重新注册成商户,旧授权**自动复活**,超管以为撤销了的对外数据
#      授权其实还在。开发库里当时已攒下一条这样的孤儿。
#   ② DROP TABLE 排在第一步、还不带 IF EXISTS。后面任一步失败,这个商户就
#      **永远删不掉**:重试卡在"表不存在"上,恒回"删除用户扩展信息失败",
#      只能人进库手工把表建回去才解得开。
#   ③ extend_table 为空串会拼出 DROP TABLE `` 这种废 SQL,报错指不到真因。
#
# 还顺带钉住 hi/did/admin.proto 上那句要求:「handler 侧无内联校验,完全靠拦截器
# —— 后端 bump 后必须实测『非超管调 Delete 被拒』」。
#
# 用法:bash smoke-merchant-delete.sh    非 0 退出 = 有失败项
# 只能在 .64 跑(要 grpcurl + protoset);查库经 _endpoints.sh 的 mysqlq 转到 .65。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"
pass=0; fail=0
ok()  { printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad() { printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
eq()  { [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=[$3] got=[$2]"; }

command -v grpcurl >/dev/null || { echo "  ✗ 没有 grpcurl —— 这个脚本只能在 .64 跑"; exit 2; }
have_db || { echo "  ✗ 够不着 mysql,断言全部无法执行"; exit 2; }

# ── 凭证:hidid 体系的 token(club 的在这里不认)────────────────────────────
echo "── 取 hidid 登录 token(.66 didtok)──"
OUT=$(ssh -n -o ConnectTimeout=10 192.168.1.66 "cd /tmp/didtok && ./target/release/didtok 2>/dev/null")
TOK=$(echo "$OUT" | grep '^TOKEN=' | cut -d= -f2-)
ADMIN=$(echo "$OUT" | grep '^DID=' | cut -d= -f2)
[ -n "$TOK" ] && [ -n "$ADMIN" ] || { echo "  ✗ 拿不到 didtok token,后续全部无法执行(.66:/tmp/didtok 还在么?)"; exit 1; }
ok "hidid 登录 did=$ADMIN"

g(){ grpcurl $(tp $DID_GRPC) -protoset $PS -H "authorization: Bearer $TOK" -d "$1" $DID_GRPC "$2" 2>&1; }

# ── ① 先在**还不是超管**时验拦截器 ────────────────────────────────────────
# 顺序不能反:插了超管行再验就永远是绿的。
echo "── 拦截器(proto 里点名要实测的那条)──"
eq "非超管调 Delete 被拒" "$(g '{"id":"znosuchmerchant"}' hi.did.MerchantManage/Delete | grep -c 'PermissionDenied')" "1"
eq "非超管调 List 被拒"   "$(g '{}' hi.did.MerchantManage/List   | grep -c 'PermissionDenied')" "1"

# ── 夹具 ────────────────────────────────────────────────────────────────
SFX="dt$$"
A="zSMK${SFX}a"; B="zSMK${SFX}b"; C="zSMK${SFX}c"
TA="DBUserInformationExtension_$A"
cleanup() {
  mysqlq hi_did "delete from hi_superadmin where did='$ADMIN' and note like '冒烟:%';
                 delete from hi_merchant_grant where merchant like 'zSMK${SFX}%' or grantee like 'zSMK${SFX}%';
                 delete from hi_merchant where did like 'zSMK${SFX}%';
                 drop table if exists \`$TA\`;" >/dev/null
}
trap cleanup EXIT

echo "── 造夹具 + 临时提超管 ──"
mysqlq hi_did "
  insert into hi_superadmin (did, note, created_at, updated_at) values ('$ADMIN','冒烟:删商户,脚本退出时自删',now(),now());
  insert into hi_merchant (token,did,name,btc,eth,trx,sol,apt,server_did,extend_table,created_at,updated_at) values
    ('tok$A','$A','冒烟A',1,3,3,3,1,'$A','$TA',now(),now()),
    ('tok$B','$B','冒烟B-扩展表本来就没了',1,3,3,3,1,'$B','DBUserInformationExtension_$B',now(),now()),
    ('tok$C','$C','冒烟C-表名为空',1,3,3,3,1,'$C','',now(),now());
  create table if not exists \`$TA\` (id int not null auto_increment, did varchar(255) null, primary key (id), unique index did(did)) engine=InnoDB;
  insert ignore into \`$TA\` (did) values ('$A');
  insert into hi_merchant_grant (merchant,grantee,note,created_at,updated_at) values
    ('$A','$B','冒烟:A授权给B',now(),now()),
    ('$B','$A','冒烟:B授权给A',now(),now());" >/dev/null
eq "夹具三个商户就位" "$(mysqlq hi_did "select count(*) from hi_merchant where did like 'zSMK${SFX}%'")" "3"
eq "夹具两条授权行就位" "$(mysqlq hi_did "select count(*) from hi_merchant_grant where merchant like 'zSMK${SFX}%' or grantee like 'zSMK${SFX}%'")" "2"

# 超管名单有 60s 缓存(见 smoke/TEST-CREDENTIALS.md)。不等就会拿到 PermissionDenied,
# 那看着像"权限闸坏了",其实只是缓存没过期 —— 宁可慢 70 秒,也不要一个指错方向的红。
echo "── 等超管名单缓存过期(70s)──"
sleep 70
# 探针**不能用 List**:List 会遍历所有商户去 hi_user 里取 name/avatar,只要有一个
# 商户(比如本脚本刚造的夹具)在 hi_user 里没有对应行,整页就 500「user not found」——
# 那时探针会红成"权限没生效",指错方向。用一个必定走到 handler 的 Delete 代替:
# 拿到「商户不存在」就说明已经穿过拦截器了(没穿过的话是 PermissionDenied)。
eq "超管权限已生效" "$(g '{"id":"znosuchmerchant"}' hi.did.MerchantManage/Delete | grep -c '商户不存在')" "1"

# ── ② 删完整商户:商户行 / 扩展表 / **两个方向的授权行** 都要没 ────────────
echo "── 删完整商户 ──"
eq "删A返回空" "$(g "{\"id\":\"$A\"}" hi.did.MerchantManage/Delete | tr -d ' \n')" "{}"
eq "A 的商户行没了"   "$(mysqlq hi_did "select count(*) from hi_merchant where did='$A'")" "0"
eq "A 的扩展表没了"   "$(mysqlq information_schema "select count(*) from tables where table_schema='hi_did' and table_name='$TA'")" "0"
# ↓ bug ①:原来这里是 2 —— 两个方向的授权行原样留着,deleted_at 还是 NULL。
eq "A 两个方向的授权行都没了(含软删)" \
   "$(mysqlq hi_did "select count(*) from hi_merchant_grant where merchant='$A' or grantee='$A'")" "0"

# ── ③ 扩展表本来就不存在:必须仍能删掉(重试幂等)────────────────────────
echo "── 重试幂等(扩展表已不存在)──"
# ↓ bug ②:原来这里恒回"删除用户扩展信息失败",商户永远删不掉。
eq "删B返回空" "$(g "{\"id\":\"$B\"}" hi.did.MerchantManage/Delete | tr -d ' \n')" "{}"
eq "B 的商户行没了" "$(mysqlq hi_did "select count(*) from hi_merchant where did='$B'")" "0"

# ── ④ extend_table 为空串 ───────────────────────────────────────────────
echo "── extend_table 为空串 ──"
eq "删C返回空" "$(g "{\"id\":\"$C\"}" hi.did.MerchantManage/Delete | tr -d ' \n')" "{}"
eq "C 的商户行没了" "$(mysqlq hi_did "select count(*) from hi_merchant where did='$C'")" "0"

# ── ⑤ 删不存在的:报"商户不存在",不是 500 别的话 ────────────────────────
eq "再删一次 A 报商户不存在" "$(g "{\"id\":\"$A\"}" hi.did.MerchantManage/Delete | grep -c '商户不存在')" "1"

# ── ⑥ 收尾必须自己证明清干净了 ─────────────────────────────────────────
# 清理静默失败过(smoke-lua-deps 那次把 ldep-demo 留在真机器人上还报了 11/0),
# 所以这里**先清、再断言**,清不干净照样红。
echo "── 收尾 ──"
cleanup
trap - EXIT
eq "夹具商户行清零"   "$(mysqlq hi_did "select count(*) from hi_merchant where did like 'zSMK${SFX}%'")" "0"
eq "夹具授权行清零"   "$(mysqlq hi_did "select count(*) from hi_merchant_grant where merchant like 'zSMK${SFX}%' or grantee like 'zSMK${SFX}%'")" "0"
eq "临时超管行已删"   "$(mysqlq hi_did "select count(*) from hi_superadmin where did='$ADMIN' and note like '冒烟:%'")" "0"

echo
printf "结果:通过 \033[32m%d\033[0m,失败 \033[31m%d\033[0m\n" "$pass" "$fail"
[ "$fail" -eq 0 ]

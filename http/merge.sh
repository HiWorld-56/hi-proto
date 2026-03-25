#!/usr/bin/env bash
# 依赖: yq v4+
# 安装yq: 
#    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
#    chmod +x /usr/local/bin/yq

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT="$SCRIPT_DIR/merged.yaml"

cat <<EOF > "$OUTPUT"
type: google.api.Service
config_version: 3

http:
  rules:
EOF

TOTAL_RULES=0

# 找到 http/ 目录下所有 *.yaml（排除 merged.yaml 本身）
FILES=$(find "$SCRIPT_DIR" -maxdepth 1 -type f -name "*.yaml" ! -name "merged.yaml" | sort)

if [ -z "$FILES" ]; then
  echo "未找到任何 http 配置文件。"
  exit 1
fi

for file in $FILES; do
  echo "合并 $file"
  COUNT=$(yq '.http.rules | length' "$file" 2>/dev/null || echo 0)
  TOTAL_RULES=$((TOTAL_RULES + COUNT))

  # 直接输出每条 rule 的 YAML
  yq eval -P '.http.rules[]' "$file" | \
    awk '
      BEGIN { indent="  " }
      /^#/ { print indent $0; next }       # 注释行，缩进两空格
      /^$/ { print ""; next }              # 空行
      /^selector:/ { print indent "- " $0; next }  # selector 开头，加列表符号
      /^[a-z]+:/ { print indent "  " $0; next }    # 其他字段缩进两格
      { print indent $0 }                  # 其他行，默认缩进两格
    ' >> "$OUTPUT"
done

echo "已生成合并文件: $OUTPUT"
echo "共合并规则数: $TOTAL_RULES"

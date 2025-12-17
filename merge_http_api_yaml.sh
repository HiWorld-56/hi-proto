#!/usr/bin/env bash
# 依赖: yq v4+
# 安装yq: 
#    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
#    chmod +x /usr/local/bin/yq

set -euo pipefail

OUTPUT="v1/merged_http_api.yaml"
SEARCH_DIRS=(v1/did v1/club v1/ai)

# mkdir -p "$(dirname "$OUTPUT")"

cat <<EOF > "$OUTPUT"
type: google.api.Service
config_version: 3

http:
  rules:
EOF

TOTAL_RULES=0

# 找到所有 http_api.yaml
mapfile -t FILES < <(find "${SEARCH_DIRS[@]}" -type f -name "http_api.yaml" | sort)

if [ ${#FILES[@]} -eq 0 ]; then
  echo "未找到任何 http_api.yaml 文件。"
  exit 1
fi

for file in "${FILES[@]}"; do
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

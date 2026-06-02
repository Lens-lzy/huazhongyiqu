#!/bin/bash
# 本地一键发布：把改动推送到 GitHub。
# 用法：在本文件夹里跑  ./deploy.sh  或  ./deploy.sh "这次改了xxx"
set -e
cd "$(dirname "$0")"

MSG="${1:-update $(date '+%Y-%m-%d %H:%M:%S')}"

if [ -z "$(git status --porcelain)" ]; then
  echo "没有改动，无需提交。"
else
  git add -A
  git commit -q -m "$MSG"
  echo "✅ 已提交：$MSG"
fi

git push origin main
echo "✅ 已推送到 GitHub。"
echo "👉 现在去服务器跑   bash ~/update-site.sh   即可让线上生效。"

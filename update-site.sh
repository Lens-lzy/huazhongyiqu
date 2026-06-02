#!/bin/bash
# 服务器端一键更新：拉取 GitHub 最新内容，让线上立即生效。
# 用法（在服务器上）：  bash ~/update-site.sh
set -e
SITE_DIR="/var/www/html/huazhongyiqu/0526"

cd "$SITE_DIR"
echo "📥 拉取最新内容..."
git fetch origin main
git reset --hard origin/main      # 以 GitHub 为准，避免本地冲突
echo "✅ 线上已更新到最新版本："
git log -1 --pretty="   %h  %s  (%cr)"

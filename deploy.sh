#!/usr/bin/env bash
# 一键发布到 GitHub Pages（个人站：<用户名>.github.io）
# 用法： ./deploy.sh 你的GitHub用户名
# 首次推送会要求登录（用 GitHub 账号 + Personal Access Token 作密码，或用 GitHub Desktop 登录后免密）
set -e
USER="$1"
if [ -z "$USER" ]; then
  echo "❌ 用法: ./deploy.sh 你的GitHub用户名"
  echo "   例如: ./deploy.sh xinjie-li"
  exit 1
fi

cd "$(dirname "$0")"
REMOTE="https://github.com/$USER/$USER.github.io.git"

git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE"
git push -u origin main

echo ""
echo "✅ 已发布 -> https://$USER.github.io"
echo "   简历页 -> https://$USER.github.io/resume.html"
echo "   （首次生效可能需 1~2 分钟；之后每次改完简历重跑 export + 此脚本即可）"

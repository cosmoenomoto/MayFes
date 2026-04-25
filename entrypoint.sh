#!/bin/bash
set -e

# 1. Rails特有の問題（PIDファイル）を削除
rm -f /app/tmp/pids/server.pid

# 2. 【重要】データベースの「棚」を自動で作る・更新する
# これがないと "relation 'sales' does not exist" エラーが直りません
bundle exec rails db:migrate

# 3. 最後に、コンテナのメインプロセス（CMDで指定した内容）を実行
exec "$@"
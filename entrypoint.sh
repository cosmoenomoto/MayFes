#!/bin/bash
set -e

# Rails特有の問題（サーバーが異常終了した時に残るpidファイル）を削除
rm -f /app/tmp/pids/server.pid

# 最後に、コンテナのメインプロセス（CMDで指定した内容）を実行
exec "$@"
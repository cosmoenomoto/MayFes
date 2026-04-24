# Rubyのバージョンを指定
FROM ruby:3.2.2

# 必要なパッケージのインストール（PostgreSQLのクライアントなど）
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# 作業ディレクトリの作成
WORKDIR /app

# 手元のGemfileをコンテナ内にコピーしてbundle install
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app

# Rails起動用スクリプト（entrypoint.sh）をコピーして実行権限を付与
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# 3000番ポートで待機
EXPOSE 3000

# Railsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
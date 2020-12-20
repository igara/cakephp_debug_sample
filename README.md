## セットアップ

```
# 環境変数の適応
(cp .example.env .env)

# VSCodeの設定ファイルを適応
(cp .vscode/.example.settings.json .vscode/settings.json)

# オレオレ証明書作成
brew install mkcert
mkcert -install
(cd docker/nginx && mkdir -p openssl && cd openssl && mkcert localhost 127.0.0.1)

docker-compose up

# 別ターミナルで作業する
docker exec cakephp_debug_sample_php-fpm_1 bash -c "cd /var/www/cakephp && composer self-update --1 && composer install"

# docker-compose up したターミナルでコンテナ起動し直す
docker-compose down
docker-compose up
```

## メモ

コンテナに入るとき

```
docker exec -it cakephp_debug_sample_php-fpm_1 bash
```

composer 1系を使用するとき

```
composer self-update --1
```

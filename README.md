## セットアップ

```
# 環境変数の適応
(cp ./cakephp/config/.env.example ./cakephp/config/.env)
(cp ./cakephp/config/app_local.example.php ./cakephp/config/app_local.php)

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

### VSCode Remote Containers

Reopen in Container からコンテナ上に VSCode を起動させる

### テスト実行

```
cd /var/www/cakephp
./vendor/bin/phpunit-watcher watch
```

## メモ

コンテナに入るとき

```
docker exec -it cakephp_debug_sample_php-fpm_1 bash
```

composer 1 系を使用するとき

```
composer self-update --1
```

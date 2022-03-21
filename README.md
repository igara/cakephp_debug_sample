## セットアップ

```
# 環境変数の適応
(cp .env.example .env)
(cp projects/cakephp/cakephp_debug_sample_projects_core && cp config/app_local.example.php config/app_local.php)
(cp projects/cakephp/cakephp_debug_sample_projects_www && cp config/app_local.example.php config/app_local.php)

# オレオレ証明書作成
brew install mkcert
mkcert -install
(cd docker/nginx && mkdir -p openssl && cd openssl && mkcert localhost 127.0.0.1)

docker-compose up

# 別ターミナルで作業する

## composer install
docker exec cakephp_debug_sample_php-fpm bash -c "cd /var/www/projects/cakephp/cakephp_debug_sample_projects_core && composer install"
docker exec cakephp_debug_sample_php-fpm bash -c "cd /var/www/projects/cakephp/cakephp_debug_sample_projects_www && composer install"


# docker-compose up したターミナルでコンテナ起動し直す
docker-compose down
docker-compose up
```

### VSCode Remote Containers

Reopen in Container からコンテナ上に VSCode を起動させる

### テスト実行

```
docker exec cakephp_debug_sample_php-fpm bash -c "cd /var/www/projects/cakephp/cakephp_debug_sample_projects_core && ~/.composer/vendor/bin/phpunit-watcher watch"
docker exec cakephp_debug_sample_php-fpm bash -c "cd /var/www/projects/cakephp/cakephp_debug_sample_projects_www && ~/.composer/vendor/bin/phpunit-watcher watch"
```

### Core を更新するとき

```
docker exec cakephp_debug_sample_php-fpm bash -c "cd /var/www/projects/cakephp/cakephp_debug_sample_projects_www && composer update projects/core"
docker exec cakephp_debug_sample_php-fpm bash -c "cd /var/www/projects/cakephp/cakephp_debug_sample_projects_www && composer dumpautoload"
```

## メモ

コンテナに入るとき

```
docker exec -it cakephp_debug_sample_php-fpm bash
```

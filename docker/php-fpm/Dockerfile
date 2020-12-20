FROM php:7.4-fpm-alpine

RUN apk upgrade --update && \
  apk --no-cache add icu-dev autoconf make g++ gcc oniguruma-dev bash

RUN docker-php-ext-install -j$(nproc) iconv intl mbstring pdo_mysql opcache && \
  pecl install xdebug && \
  docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
  composer config -g process-timeout 3600 && \
  composer config -g repos.packagist composer https://packagist.jp

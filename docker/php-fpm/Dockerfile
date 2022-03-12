FROM php:8-fpm

RUN apt-get update \
  && apt-get install -y bash libonig-dev libicu-dev libxml2-dev git \
  && docker-php-ext-install mbstring intl simplexml pdo_mysql \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
  composer config -g process-timeout 3600 && \
  composer config -g repos.packagist composer https://packagist.jp
RUN composer global require spatie/phpunit-watcher

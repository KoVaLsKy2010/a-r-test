FROM yiisoftware/yii2-php:7.1-apache

LABEL maintainer="ALEXEY GALIEV"

RUN apt-get update \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

COPY . .

RUN composer clearcache

RUN composer install

RUN chmod -R ugo+rwx web/assets
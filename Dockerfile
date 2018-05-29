
FROM php:5.6.36-fpm-alpine3.7
RUN apk add --no-cache --virtual .build-deps \
    g++ make autoconf
RUN pecl install redis-4.0.1 \
    && pecl install \
    && docker-php-ext-install mbstring mysqli pdo pdo_mysql shmop \
    && docker-php-ext-enable redis   mbstring mysqli pdo pdo_mysql shmop

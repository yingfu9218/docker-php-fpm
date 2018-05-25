FROM php:5.6.36-fpm-alpine3.7
RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable redis 

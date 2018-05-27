FROM php:7.2.6-fpm-alpine3.7
RUN apk add --no-cache --virtual .build-deps \
    g++ make autoconf
RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable redis xdebug 
    
RUN apk --update libpng libpng-devel    

RUN docker-php-ext-install gd

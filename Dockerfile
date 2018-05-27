FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv  mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd 
RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && pecl install mcrypt-1.0.1 \
    && docker-php-ext-enable redis xdebug mcrypt


FROM php:7.2.6-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \    
RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0  mcrypt-1.0.1 \
    && docker-php-ext-install -j$(nproc)  mbstring mysqli pdo pdo_mysql shmop iconv mcrypt  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
     && docker-php-ext-install -j$(nproc) gd  \
    && docker-php-ext-enable redis xdebug  mbstring mysqli pdo pdo_mysql shmop mcrypt

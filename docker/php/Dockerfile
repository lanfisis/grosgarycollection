FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
        libcurl4-openssl-dev \
        vim \
        nano \
        wget \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libpng-dev \
        libicu-dev \
        libreadline-dev \
        libxslt1-dev \
        libpcre3-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install opcache soap bcmath gd intl mcrypt pdo_mysql iconv xsl zip exif

RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

COPY config/php.ini  /usr/local/etc/php/
COPY config/www.conf /usr/local/etc/php-fpm.d/
COPY config/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/
COPY config/docker-php-ext-opcache.ini /usr/local/etc/php/conf.d/
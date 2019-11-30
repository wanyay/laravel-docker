#!/bin/sh

# add wget
apt-get update -yqq && apt-get -f install -yyq wget libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    libfreetype6-dev libcurl4-openssl-dev pkg-config libssl-dev

# download helper script
# @see https://github.com/mlocati/docker-php-extension-installer/
wget -q -O /usr/local/bin/install-php-extensions https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions \
    || (echo "Failed while downloading php extension installer!"; exit 1)

docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
    --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir \
    --enable-gd-native-ttf

git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis

# install extensions
chmod uga+x /usr/local/bin/install-php-extensions && sync && install-php-extensions redis \
	mongodb \
    bcmath \
	pdo_mysql\
    mysqli \
    gd \
    mbstring \
    zip \
    exif
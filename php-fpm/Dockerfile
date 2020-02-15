ARG TARGET_PHP_VERSION=7.2
FROM php:${TARGET_PHP_VERSION}-fpm-stretch

COPY ./shared/ /tmp/scripts/
RUN chmod +x -R /tmp/scripts/

# set timezone
ARG TZ=UTC
RUN /tmp/scripts/set_timezone.sh ${TZ}

# add users
ARG SERVICE_DIR="./php-fpm"
ARG APP_USER=www-data
ARG APP_GROUP=www-data
ARG APP_USER_ID=1000
ARG APP_GROUP_ID=1000

RUN /tmp/scripts/create_user.sh ${APP_USER} ${APP_GROUP} ${APP_USER_ID} ${APP_GROUP_ID}

RUN /tmp/scripts/install_software.sh

RUN /tmp/scripts/install_php_extensions.sh

RUN apt-get update

RUN apt-get install -y ffmpeg

# workdir
ARG APP_CODE_PATH="/var/www/"
WORKDIR "$APP_CODE_PATH"


RUN /tmp/scripts/cleanup.sh

COPY ./php-fpm/php.ini /usr/local/etc/php/

EXPOSE 9000

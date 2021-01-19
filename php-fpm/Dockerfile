ARG TARGET_PHP_VERSION=${PHP_VERSION}
FROM php:${TARGET_PHP_VERSION}-fpm

COPY ./shared/ /tmp/scripts/
RUN chmod +x -R /tmp/scripts/

# set timezone
ARG TZ=${TIMEZONE}
RUN /tmp/scripts/set_timezone.sh ${TZ}

# add users
ARG SERVICE_DIR="./php-fpm"
ARG APP_USER=${APP_USER}
ARG APP_GROUP=${APP_GROUP}
ARG APP_USER_ID=${APP_USER_ID}
ARG APP_GROUP_ID=${APP_GROUP_ID}

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

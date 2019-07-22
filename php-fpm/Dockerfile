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

RUN /tmp/scripts/install_php_extensions.sh

RUN /tmp/scripts/install_software.sh

# php-fpm pool config
# COPY ${SERVICE_DIR}/php-fpm.d/* /usr/local/etc/php-fpm.d
# RUN /tmp/scripts/modify_config.sh /usr/local/etc/php-fpm.d/app.conf \
#     "__APP_USER" \
#     "${APP_USER}" \
#  && /tmp/scripts/modify_config.sh /usr/local/etc/php-fpm.d/app.conf \
#     "__APP_GROUP" \
#     "${APP_GROUP}" \
# ;

# workdir
ARG APP_CODE_PATH="/var/www/"
WORKDIR "$APP_CODE_PATH"

# # entrypoint
# RUN mkdir -p /bin/docker-entrypoint/ \
#  && cp /tmp/scripts/docker-entrypoint/* /bin/docker-entrypoint/ \
#  && chmod +x -R /bin/docker-entrypoint/ \
# ;

RUN /tmp/scripts/cleanup.sh

EXPOSE 9000

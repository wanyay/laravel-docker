FROM nginx:latest

RUN ln -snf /usr/share/zoneinfo/UTC /etc/localtime && echo UTC > /etc/timezone

ARG SERVICE_DIR='./nginx'
ARG APP_USER=www-data
ARG APP_GROUP=www-data
ARG APP_USER_ID=1000
ARG APP_GROUP_ID=1000

COPY ./shared/ /tmp/scripts/
RUN chmod -R 777 /tmp/scripts/

RUN /tmp/scripts/create_user.sh ${APP_USER} ${APP_GROUP} ${APP_USER_ID} ${APP_GROUP_ID}

RUN apt-get update -yqq && apt-get install -yqq \
    curl \
    dnsutils \
    gdb \
    git \
    htop \
    iputils-ping \
    ltrace \
    make \
    procps \
    strace \
    sudo \
    sysstat \
    unzip \
    vim \
    wget \
;

COPY ${SERVICE_DIR}/nginx.conf /etc/nginx/
ARG APP_USER
RUN /tmp/scripts/modify_config.sh /etc/nginx/nginx.conf \
    "__APP_USER" \
    "${APP_USER}" \
 && /tmp/scripts/modify_config.sh /etc/nginx/nginx.conf \
    "__APP_GROUP" \
    "${APP_GROUP}" \
;

COPY ${SERVICE_DIR}/sites-available/* /etc/nginx/sites-available/
ARG APP_CODE_PATH
RUN /tmp/scripts/modify_config.sh /etc/nginx/sites-available/default.conf \
    "__NGINX_ROOT" \
    "${APP_CODE_PATH}" \
;

WORKDIR /etc/nginx/

RUN apt-get clean 

CMD ["nginx"]

EXPOSE 80 443
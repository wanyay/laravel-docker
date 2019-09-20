FROM node:alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY ./laravel-echo/package.json /usr/src/app/

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base

RUN npm install

# Bundle app source
COPY ./laravel-echo/laravel-echo-server.json /usr/src/app/laravel-echo-server.json

EXPOSE 6001
CMD [ "npm", "start", "--force" ]
ARG PHP_VERSION
ARG ALPINE_VERSION

FROM php:${PHP_VERSION}-fpm-alpine${ALPINE_VERSION}

ARG APP
ARG APP_NAME
ARG COMPOSER_VERSION
ARG GROUP
ARG PHP_CONFIG
ARG PHP_INI_FILE
ARG PHP_PORT
ARG UID
ARG USER

## Update & Upgrade Alpine OS
RUN apk update --no-cache \
  && apk upgrade --no-cache

## Directly Execute the install-php-extensions command, Install Any Necessary PHP Extensions, & Add Non-Root User/Group
RUN curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - | sh -s \
  mysqli \
  pdo \
  pdo_mysql \
  xdebug \
  && docker-php-ext-enable mysqli pdo_mysql

## Change Working Directory to Config Directory
WORKDIR /usr/local/etc

## Add Any Config Files to Image File System
COPY ${PHP_CONFIG}/php.ini ./php/php.ini
COPY ${PHP_CONFIG}/conf.d/fpm.ini ./php/conf.d/docker-fpm.ini
COPY ${PHP_CONFIG}/conf.d/xdebug.ini ./php/conf.d/docker-php-ext-xdebug.ini
COPY ${PHP_CONFIG}/php-fpm.d/global.conf ./php-fpm.d/global.conf
COPY ${PHP_CONFIG}/php-fpm.d/www.conf ./php-fpm.d/www.conf

## Make Log Directory & Allow Non-Root User Permissions
RUN mkdir -p /var/log/${APP_NAME} \
  && addgroup -S -g ${UID} ${GROUP} \
  && adduser -D -H -u ${UID} -G ${GROUP} ${USER}  

## Add Project Directory to Image File System & Allow Non-Root User Permissions
COPY --chown=${UID}:${UID} ${APP} /var/www/html

## Switch to Non-Root User 
USER ${UID}:${UID}

## Change Working Directory to Project Root
WORKDIR /var/www/html/public_html

## Document Exposed Port 
EXPOSE ${PHP_PORT}

## Execute php-fpm in Forefront
ENTRYPOINT ["php-fpm", "-F"]
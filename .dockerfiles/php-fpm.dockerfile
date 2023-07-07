ARG PHP_VERSION

FROM php:${PHP_VERSION}-fpm-alpine

RUN apk update --no-cache; \
  apk upgrade --no-cache;

ARG COMPOSER_VERSION

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

ARG COMPOSER_VERSION

RUN chmod +x /usr/local/bin/install-php-extensions \
  && install-php-extensions mysqli pdo pdo_mysql xdebug @composer-${COMPOSER_VERSION} \
  && docker-php-ext-enable mysqli pdo_mysql

ARG USER
ARG GROUP
ARG UID

RUN addgroup -S -g ${UID} ${GROUP} \
  && adduser -D -H -u ${UID} -G ${GROUP} ${USER}

ARG UID
ARG USER
ARG GROUP
ARG APP_NAME

WORKDIR /usr/local/etc

RUN mkdir -p /var/log/${APP_NAME} \
  && chown -R ${USER}:${GROUP} /var/log/${APP_NAME} /var/www/html

ARG PHP_CONFIG
ARG PHP_INI_FILE

COPY ${PHP_CONFIG}/php.ini ./php/php.ini

COPY ${PHP_CONFIG}/conf.d/fpm.ini ./php/conf.d/docker-fpm.ini
COPY ${PHP_CONFIG}/conf.d/xdebug.ini ./php/conf.d/docker-php-ext-xdebug.ini

COPY ${PHP_CONFIG}/php-fpm.d/global.conf ./php-fpm.d/global.conf
COPY ${PHP_CONFIG}/php-fpm.d/www.conf ./php-fpm.d/www.conf

ARG APP_NAME
ARG APP
ARG PHP_PORT
ARG USER

COPY ${APP} /var/www/html

VOLUME ["/var/www/html"]
VOLUME ["/var/log/${APP_NAME}"]

WORKDIR /var/www/html/public_html

USER ${USER}

EXPOSE ${PHP_PORT}

CMD ["php-fpm", "-F"]
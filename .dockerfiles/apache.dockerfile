ARG APACHE_VERSION
ARG ALPINE VERSION

FROM httpd:${APACHE_VERSION}-alpine${ALPINE_VERSION}

RUN apk update --no-cache; \
  apk upgrade --no-cache;

WORKDIR /usr/local/apache2

## Add Low-Privilege User and Grant Permissions
ARG USER
ARG GROUP
ARG UID
ARG APP_NAME
ARG VIRTUAL_HOST

RUN addgroup -S -g ${UID} ${GROUP} \
  && adduser -S -D -u ${UID} -s --disabled-password --gecos "" --no-create-home -G ${GROUP} ${USER} \
  && mkdir -p ./htdocs/${VIRTUAL_HOST}/public_html \
  && chown -R ${UID}:${UID} ./logs ./conf ./htdocs/${VIRTUAL_HOST}/public_html

ARG UID

USER ${UID}

ARG APACHE_CONFIG

## Replace Config File in Container
COPY ${APACHE_CONFIG}/httpd.conf ./conf/httpd.conf
COPY ${APACHE_CONFIG}/extra/ssl.conf ./conf/extra/httpd-ssl.conf
COPY ${APACHE_CONFIG}/extra/vhosts.conf ./conf/extra/httpd-vhosts.conf

ARG APACHE_PUBLIC_HTML
ARG VIRTUAL_HOST
ARG APACHE_LOGS

## Serve Public Files to Container
COPY ${APACHE_PUBLIC_HTML} ./htdocs/${VIRTUAL_HOST}/public_html

VOLUME ["/usr/local/apache2/htdocs/${VIRTUAL_HOST}/public_html"]

VOLUME ["/usr/local/apache2/logs"]


EXPOSE 443

WORKDIR /usr/local/apache2/htdocs/${VIRTUAL_HOST}/public_html

# Start server in foreground
CMD ["httpd", "-D", "FOREGROUND"]
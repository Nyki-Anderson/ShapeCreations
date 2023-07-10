ARG ALPINE_VERSION
ARG APACHE_VERSION

FROM httpd:${APACHE_VERSION}-alpine${ALPINE_VERSION}

ARG APACHE_CONFIG
ARG APACHE_HTTP_PORT
ARG APACHE_HTTPS_PORT
ARG APACHE_PUBLIC_HTML
ARG GROUP
ARG UID
ARG USER
ARG VIRTUAL_HOST

## Update and Upgrade Alpine OS without Cache 
RUN apk update --no-cache \
  && apk upgrade --no-cache

## Change Working Directory to Server Root
WORKDIR /usr/local/apache2

## Add Config Files (Accessible only by Root User)
COPY ${APACHE_CONFIG}/httpd.conf ./conf/httpd.conf
COPY ${APACHE_CONFIG}/extra/ssl.conf ./conf/extra/httpd-ssl.conf
COPY ${APACHE_CONFIG}/extra/vhosts.conf ./conf/extra/httpd-vhosts.conf

## Add Non-Root User/Group & Make Project and Log Directories
RUN addgroup -S -g ${UID} ${GROUP} \
  && adduser -S -D -u ${UID} -s --disabled-password --gecos "" --no-create-home -G ${GROUP} ${USER} \
  && mkdir -p ./htdocs/${VIRTUAL_HOST}/public_html /logs

## Adjust Permissions & Serve Public Files to Container
COPY --chown=${UID}:${UID} ${APACHE_PUBLIC_HTML} ./htdocs/${VIRTUAL_HOST}/public_html

## Switch to Non-Root User for Remainder of Build
USER ${UID}:${UID}

## Document Exposed Privileged Port
EXPOSE ${APACHE_HTTP_PORT}
EXPOSE ${APACHE_HTTPS_PORT}

## Change Working Directory to Project Document Root
WORKDIR /usr/local/apache2/htdocs/${VIRTUAL_HOST}/public_html

## Execute Server in Foreground
ENTRYPOINT ["httpd", "-D", "FOREGROUND"]
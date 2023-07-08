ARG DB_VERSION

FROM mariadb:${DB_VERSION}

ARG DB_CONFIG
ARG DB_INIT_SCRIPTS

## Update & Upgrade OS
RUN apt update -y \
  && apt upgrade -y

## Copy All Configuration Files to Container Filesystem
COPY ${DB_CONFIG} /etc/mysql/conf.d

## Import Any .sql Scripts to Fresh Database Instance
#COPY ${DB_INIT_SCRIPTS} /var/lib/mysql/docker-entrypoint-initdb.d

## Document Container Exposed Port
EXPOSE 3306
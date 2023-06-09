ARG DB_VERSION

FROM mariadb:${DB_VERSION}

RUN apt update -y \
  && apt upgrade -y

ARG DB_CONFIG

## Copy All Configuration Files to Container Configuration Directory
COPY ${DB_CONFIG} /etc/mysql/conf.d

ARG DB_INIT_SCRIPTS

## Copy All Database Data to MariaDB Data Directory
#COPY ${DB_INIT_SCRIPTS} /var/lib/mysql/docker-entrypoint-initdb.d

VOLUME ["/var/lib/mysql"]
VOLUME ["/docker-entrypoint-initdb.d"]
VOLUME ["/var/log/"]

## Document Container Exposed Port
EXPOSE 3306
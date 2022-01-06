FROM debian:buster

LABEL maintainer="Jraye"

RUN apt update && \
	apt upgrade -y && \
	apt install -y mariadb-server

RUN mkdir -p /run/mysqld
COPY ./my.cnf /etc/my.cnf
COPY start_mariadb.sh ./

EXPOSE 3307

ENTRYPOINT sh ./start_mariadb.sh
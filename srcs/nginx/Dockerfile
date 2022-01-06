FROM debian:buster

LABEL maintainer="Jraye"

RUN apt update && \
	apt upgrade -y && \
	apt install -y nano curl openssl net-tools nginx

RUN mkdir /var/ssl/

RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=RU/ST=Russia/L=Moscow/O=CAO/OU=Moscow21/CN=me" \
	-newkey rsa:2048 -keyout /var/ssl/localhost.key \
	-out /var/ssl/localhost.crt

RUN rm -f /etc/nginx/sites-available/default
COPY nginx.conf /etc/nginx/sites-available/nginx.conf
RUN rm -f /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN rm -f index.nginx-debian.html

EXPOSE 443

ENTRYPOINT nginx -g 'daemon off;'
FROM debian:buster

LABEL maintainer="Jraye"

WORKDIR /var/www/html/

RUN apt update && \
	apt upgrade -y && \
	apt install -y wget \
    php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring php-xml

RUN wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && rm -f latest.tar.gz

RUN rm -f wordpress/wp-config-sample.php
COPY wp-config.php wordpress/wp-config.php

RUN chown -R www-data:www-data /var/www/html/

# COPY start_wp.sh /var/www/scripts/start_wp.sh

EXPOSE 9000

# ENTRYPOINT sh ../scripts/start_wp.sh

RUN sh /etc/init.d/php7.3-fpm start

ENTRYPOINT /usr/sbin/php-fpm7.3 -F
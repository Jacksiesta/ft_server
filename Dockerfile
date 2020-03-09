FROM debian:buster

RUN apt update \
&& apt install nginx -y \
&& apt install mariadb-server -y \
&& apt install php-fpm php-mysql -y 

RUN mkdir test

CMD  service nginx restart && tail -f /dev/null

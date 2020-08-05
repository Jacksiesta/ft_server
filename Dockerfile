FROM debian:buster

RUN apt update \
&& apt install nginx -y \
&& apt install mariadb-server -y \
&& apt install mysql-server -y

COPY srcs/wordpress /var/www/wordpress
COPY srcs/phpmyadmin /var/www/phpmyadmin

# install both packages 
RUN apt install php-fpm php-mysql -y

RUN mkdir test

CMD  service nginx restart && tail -f /dev/null

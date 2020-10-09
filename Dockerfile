FROM debian:buster


RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y nginx
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y mariadb-server
RUN apt-get install -y openssl


COPY /srcs/nginxconf /etc/nginx/sites-available/
COPY /srcs/phpMyAdmin /var/www/phpmyadmin
COPY /srcs/wordpress /var/www/wordpress 
RUN rm -rf /var/www/html

RUN ln -sf /etc/nginx/sites-available/nginxconf /etc/nginx/sites-enabled/
RUN unlink /etc/nginx/sites-enabled/default

COPY srcs/db_init.sql .
RUN service mysql start && cat db_init.sql | mariadb -u root

RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=jherrald" -addext "subjectAltName=DNS:jherrald" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

CMD service mysql start && service php7.3-fpm start && nginx -g "daemon off;"

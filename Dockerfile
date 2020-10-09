FROM debian:buster

# install packages 
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y nginx
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y mariadb-server
RUN apt-get install -y openssl

# copy nginx configuration file
COPY /srcs/nginxconf /etc/nginx/sites-available/

COPY srcs/wordpress /var/www/wordpress
COPY srcs/phpmyadmin /var/www/phpmyadmin
RUN rm -rf /var/www/html

# activate config by linking to the config file from nginx's sites-enables directory
RUN ln -sf /etc/nginx/sites-available/nginxconf /etc/nginx/sites-enabled/

# unlink nginx default config file
RUN unlink /etc/nginx/sites-enabled/default

#copy db creation file
COPY srcs/maria_conf.sql .

# lauch + create db with maria_onf as root
RUN service mysql start && cat maria_conf.sql | mariadb -u root

# settings for openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=jherrald" -addext "subjectAltName=DNS:jherrald" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

#starts mysql php nginx + command to run continuously
CMD service mysql start && service php7.3-fpm start && nginx -g "daemon off;"

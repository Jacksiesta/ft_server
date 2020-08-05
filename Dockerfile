FROM debian:buster

RUN echo 'HELLO'

RUN apt update \
&& apt install nginx -y \
&& apt install mariadb-server -y \
&& apt install mysql-server -y

COPY srcs/wordpress /var/www/wordpress
COPY srcs/phpmyadmin /var/www/phpmyadmin

# install both packages 
RUN apt install php-fpm php-mysql -y

RUN apt install openssl -y

# copy nginx configuration file
COPY srcs/nginx_conf /etc/nginx/sites-available/

# activate config by linking to the config file from nginx's sites-enables directory
RUN ln -s /etc/nginx/sites-available/nginx_cong /etc/nginx/sites-enabled/

#copy db creation file
COPY srcs/maria_conf .

# lauch + create db with maria_onf as root
RUN service mysql start && cat maria_conf | mariadb -u root

RUN mkdir /var/www/mydomain

RUN mkdir test

#starts mysql php nginx
CMD service mysql start && service php-fpm start && nginx -g "daemon off;"
#CMD  service nginx restart && tail -f /dev/null

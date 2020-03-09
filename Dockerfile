FROM debian:buster

RUN apt update \
&& apt install nginx -y

RUN mkdir test

CMD  service nginx restart && tail -f /dev/null

FROM debian:buster


RUN apt -y update 

COPY tools/init.sh .

RUN apt install wget -y && apt install php php-mysql  -y


CMD ["bash","init.sh"]
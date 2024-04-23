FROM debian:11.8


RUN apt -y update 

COPY tools/init.sh .

RUN apt install wget -y && apt install php php-mysql  -y


CMD ["bash","init.sh"]
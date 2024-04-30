# FROM debian:11.8
FROM baseimage


RUN apt -y update 

COPY tools/init.sh .

RUN apt install wget -y && apt install php php-mysql  -y
RUN apt clean 

CMD ["bash","init.sh"]
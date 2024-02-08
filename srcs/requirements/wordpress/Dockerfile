# Use the Debian 11.8 base image
FROM debian:11.8


# Install PHP and required extensions
RUN apt-get update \
    && apt-get install -y php php-fpm php-mysql wget 

RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress /var/www/html 

CMD ["bash"] 

# Use the Debian 11.8 base image
# FROM debian:11.8
FROM baseimage


# Install PHP and required extensions
RUN apt-get update \
    && apt-get install -y php php-fpm php-mysql wget

RUN mkdir -p /var/www/html

# Create the directory for PHP-FPM socket

#Install Wordpress

#RUN wget https://wordpress.org/latest.tar.gz && \
#   tar -xvzf latest.tar.gz && \
#    rm latest.tar.gz && \
#    mv wordpress /var/www/html

#COPY wp-config.php /var/www/html
COPY tools/init.sh .

# # Install Tini
# ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
# RUN chmod +x /tini
#Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp


# Use tini as the entrypoint
# ENTRYPOINT ["/tini", "--"]


RUN mkdir -p /run/php/
RUN chmod 755 /run/php/

# WORKDIR /var/www/html

#script for WpCLI
#CMD ["tail", "-f", "/dev/null"]
CMD ["bash", "init.sh"]



# Start php-fpm
#CMD ["/usr/sbin/php-fpm7.4", "-F"]
#CMD ["bash"] 

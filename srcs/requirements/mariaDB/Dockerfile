# Use the official Debian image as the base image
FROM debian:11.8

# Install necessary packages
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Create the directory for the MySQL socket
RUN mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/ && \
    chmod -R 777 /run/mysqld

# Set environment variables for MariaDB
#NOT HERE. 

# Copy the initialization SQL script and .cnf file into the container
COPY init.sql /docker-entrypoint-initdb.d/
COPY init.sh /etc/mysql/
RUN chmod +x /etc/mysql/init.sh

# Expose the default MariaDB port
EXPOSE 3306

# Install Tini
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini

# Set the entrypoint using Tini and run the init.sh script
ENTRYPOINT ["/tini", "--"]
#ENTRYPOINT ["/tini", "--debug", "/etc/mysql/init.sh"]

# Start the MariaDB service
#CMD ["mysqld", "--init-file=/docker-entrypoint-initdb.d/init.sql"]

#exec the script for initialize the service
CMD ["bash", "/etc/mysql/init.sh"]


# We Download Debian:11.8 just once for optimization. Its done in the Base Image build in /tools
FROM debian:11.8

# Install necessary packages
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Create the directory for the MySQL socket
RUN mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/ && \
    chmod -R 777 /run/mysqld
RUN chmod -R 777 /var/lib/mysql
# Copy the initialization SQL script and .cnf file into the container
COPY tools/init.sql /docker-entrypoint-initdb.d/
COPY tools/init.sh /etc/mysql/
RUN chmod +x /etc/mysql/init.sh

# Expose the default MariaDB port
EXPOSE 3306

# # Install Tini
# ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
# RUN chmod +x /tini

# # Set the entrypoint using Tini as PID1
# ENTRYPOINT ["/tini", "--"]

# Start the MariaDB service
RUN apt-get clean
#exec the script for initialize the service
CMD ["bash", "/etc/mysql/init.sh"]


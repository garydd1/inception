# Use Debian 
# FROM debian:11.8-slim
FROM baseimage

# Install Redis
RUN apt-get update && apt-get install -y redis-server && rm -rf /var/lib/apt/lists/*


# COPY redis.conf /etc/redis/redis.conf
COPY tools/init.sh .
# Expose Redis port
EXPOSE 6379

# # Install Tini
# ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
# RUN chmod +x /tini

# # Set the entrypoint using Tini and run the init.sh script
# ENTRYPOINT ["/tini", "--"]

RUN apt-get clean
CMD ["bash", "init.sh"]

# Start Redis server
# CMD ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]

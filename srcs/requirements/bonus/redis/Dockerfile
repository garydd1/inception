# Use Debian 
FROM debian:11.8-slim

# Install Redis
RUN apt-get update && apt-get install -y redis-server && rm -rf /var/lib/apt/lists/*

# Copy custom Redis configuration if needed
# COPY redis.conf /etc/redis/redis.conf

# Expose Redis port
EXPOSE 6379

# Start Redis server
CMD ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]

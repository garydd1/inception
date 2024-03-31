# Use the Debian 11.8 base image
FROM debian:11.8

# Install NGINX
RUN apt-get update && apt-get install -y nginx

# Copy NGINX configuration files
COPY default.conf /etc/nginx/conf.d/
COPY server.crt server.key /etc/nginx/
#COPY default.conf /etc/nginx/conf.d/default.conf
RUN mv /etc/nginx/sites-enabled /etc/nginx/sites-enabled_copy
# Expose port 443 for HTTPS
EXPOSE 443
# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
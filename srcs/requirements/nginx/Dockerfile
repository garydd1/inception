# Use the Debian 11.8 base image
FROM debian:11.8
# FROM baseimage

# Install NGINX
RUN apt-get update && apt-get install -y nginx

# Copy NGINX configuration files
COPY conf/default.conf /etc/nginx/conf.d/
COPY tools/server.crt tools/server.key /etc/nginx/
#COPY default.conf /etc/nginx/conf.d/default.conf
RUN mv /etc/nginx/sites-enabled /etc/nginx/sites-enabled_copy

# # Install Tini
# ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
# RUN chmod +x /tini

# # Set the entrypoint using Tini and run the init.sh script
# ENTRYPOINT ["/tini", "--"]
# Expose port 443 for HTTPS
EXPOSE 443
# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
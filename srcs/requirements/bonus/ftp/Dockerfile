# Use Debian 
FROM debian:11.8

COPY tools/init.sh .
RUN mkdir -p /home/dgarizad/ftp
RUN chmod 777 /home/dgarizad/ftp
# Install vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

# Install Tini
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini
# Set the entrypoint using Tini and run the init.sh script
ENTRYPOINT ["/tini", "--"]
# CMD ["echo", "NOOOOOO"]
CMD ["bash", "init.sh"]
# CMD ["sleep", "infinity"]


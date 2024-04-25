# FTP on Alpine Linux
FROM alpine:3.19

# Set the TERM environment variable to make sure that the terminal is set up correctly
ENV TERM xterm

# Install FTP server and OpenSSL
RUN apk update && apk upgrade && apk add --no-cache \
    vsftpd
RUN mkdir -p /home/dgarizad/ftp
RUN chmod 777 /home/dgarizad/ftp

COPY tools/init.sh .
RUN chmod +x init.sh
# Configure the FTP server
RUN sed -i "s/#local_enable=YES/local_enable=YES/" /etc/vsftpd/vsftpd.conf && \
    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd/vsftpd.conf && \
    sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd/vsftpd.conf && \
    echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "pasv_min_port=21000" >> /etc/vsftpd/vsftpd.conf && \
    echo "pasv_max_port=21000" >> /etc/vsftpd/vsftpd.conf && \
    echo "pasv_address=0.0.0.0" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_root=/home/dgarizad/ftp/files" >> /etc/vsftpd/vsftpd.conf && \
    echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf

RUN rm -f /var/cache/apk/*
# # Install Tini
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["./init.sh"]
# CMD ["/usr/sbin/vsftpd"]


# # Use Debian 
# FROM debian:11.8

# COPY tools/init.sh .
# RUN mkdir -p /home/dgarizad/ftp
# RUN chmod 777 /home/dgarizad/ftp
# # Install vsftpd
# RUN apt-get update && \
#     apt-get install -y vsftpd && \
#     rm -rf /var/lib/apt/lists/*

# # Install Tini
# # ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
# # RUN chmod +x /tini
# # Set the entrypoint using Tini and run the init.sh script
# ENTRYPOINT ["/tini", "--"]
# # CMD ["echo", "NOOOOOO"]
# CMD ["bash", "init.sh"]
# # CMD ["sleep", "infinity"]


# Use the Debian 11.8 as base image
FROM debian:11.8

RUN apt update
# Install Tini
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini

# Set Tini as the default entrypoint
ENTRYPOINT ["/tini", "--"]
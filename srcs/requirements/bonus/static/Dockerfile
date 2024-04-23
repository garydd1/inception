FROM alpine:latest

RUN apk update && \
    apk add --no-cache nodejs npm

COPY ./tools /home/app

WORKDIR /home/app

RUN npm init -y && \
    npm install express

CMD ["node", "server.js"]

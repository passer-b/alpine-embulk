FROM java:openjdk-8-jdk-alpine
MAINTAINER passer-b

RUN apk add --update curl && \
    curl --create-dirs -o /usr/local/bin/embulk -L "http://dl.embulk.org/embulk-latest.jar" && \
    chmod +x /usr/local/bin/embulk && \
    mkdir /etc/embulk

VOLUME /etc/embulk

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD embulk

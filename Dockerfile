FROM alpine:latest

RUN apk add --no-cache curl unzip

RUN curl -L -o /tmp/sing-box.zip https://github.com/SagerNet/sing-box/releases/latest/download/sing-box-linux-amd64.zip && \
    unzip /tmp/sing-box.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/sing-box && \
    rm /tmp/sing-box.zip

RUN mkdir -p /etc/sing-box

COPY config.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN chmod +x /usr/local/bin/sing-box

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]

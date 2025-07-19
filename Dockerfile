FROM alpine:latest

RUN apk add --no-cache curl unzip

# 安装 sing-box 最新版本
RUN curl -Lo /tmp/sing-box.zip https://github.com/SagerNet/sing-box/releases/latest/download/sing-box-linux-amd64.zip && \
    unzip /tmp/sing-box.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/sing-box && \
    rm /tmp/sing-box.zip

COPY sing-box.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]

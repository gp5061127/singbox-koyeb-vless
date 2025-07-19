FROM alpine:latest

# 安装 curl 等依赖
RUN apk add --no-cache curl bash

# 下载并解压 sing-box
RUN curl -L -o sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.8.0/sing-box-1.8.0-linux-amd64.tar.gz \
 && tar -xzf sing-box.tar.gz \
 && mv sing-box-*/sing-box /usr/local/bin/sing-box \
 && chmod +x /usr/local/bin/sing-box \
 && rm -rf sing-box*

# 拷贝配置文件
COPY config.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh

# 暴露 WebSocket 端口
EXPOSE 8080

CMD ["/entrypoint.sh"]

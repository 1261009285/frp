FROM alpine:latest
WORKDIR /app

RUN apk add --no-cache curl tar \
 && curl -L https://github.com/fatedier/frp/releases/latest/download/frp_0.61.1_linux_amd64.tar.gz -o frp.tar.gz \
 && tar -xzf frp.tar.gz \
 && mv frp_*/frps . \
 && rm -rf frp.tar.gz frp_*

COPY frps.ini .
CMD ["./frps", "-c", "./frps.ini"]
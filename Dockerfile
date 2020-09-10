FROM dreamacro/clash-premium:latest

MAINTAINER miniers <m@lk.mk>

ENV S6_OVERLAY_VERSION=v2.0.0.1

RUN apk add --update --no-cache bash ipcalc inotify-tools curl tzdata && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz \
    | tar xfz - -C / && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del curl tzdata && \
    rm -rf /var/cache/apk/*

ADD root /

ENTRYPOINT ["/init"]
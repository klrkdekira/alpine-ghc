FROM alpine:3.6
MAINTAINER Chee Leong <klrkdekira@gmail.com>

RUN apk update && \
    apk add --no-cache \
    ghc shadow alpine-sdk linux-headers bash \
    gmp-dev zlib-dev xz ca-certificates openssl && \
    update-ca-certificates && \
    wget -qO- https://get.haskellstack.org/ | sh && \
    stack config set system-ghc --global true && \
    rm -rf /var/cache/apk/*

CMD ["sh"]

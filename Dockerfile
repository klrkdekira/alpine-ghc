FROM alpine:3.6
MAINTAINER Chee Leong <klrkdekira@gmail.com>

RUN apk update && \
    apk add --no-cache \
    ghc shadow alpine-sdk linux-headers \
    gmp-dev zlib-dev xz ca-certificates openssl && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

RUN wget -qO- https://get.haskellstack.org/ | sh && \
    stack config set system-ghc --global true

CMD ["bash"]

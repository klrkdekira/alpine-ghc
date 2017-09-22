FROM alpine:3.6
MAINTAINER Chee Leong <klrkdekira@gmail.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
    ghc shadow alpine-sdk linux-headers bash \
    llvm3.7 perl binutils clang gcc libffi-dev \
    gmp-dev zlib-dev xz ca-certificates openssl && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

RUN wget -qO- https://get.haskellstack.org/ | sh && \
    stack config set system-ghc --global true

CMD ["bash"]

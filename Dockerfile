# https://hub.docker.com/_/alpine
ARG alpine_ver=3.14
FROM alpine:${alpine_ver}.3

ARG build_rev=3

LABEL org.opencontainers.image.source="\
    https://github.com/instrumentisto/rsync-ssh-docker-image"


# Install rsync and SSH.
RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
            rsync \
            openssh-client-default \
            ca-certificates \
 && update-ca-certificates \
 && rm -rf /var/cache/apk/*

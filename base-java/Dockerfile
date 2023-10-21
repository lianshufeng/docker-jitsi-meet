ARG JITSI_REPO=jitsi
ARG BASE_TAG=latest
FROM lianshufeng/meet-jits:base

RUN mkdir -p /usr/share/man/man1 && \
    apt-dpkg-wrap apt-get update && \
    apt-dpkg-wrap apt-get install -y openjdk-11-jre-headless && \
    apt-cleanup

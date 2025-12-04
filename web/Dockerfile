ARG JITSI_REPO=jitsi
ARG BASE_TAG=latest
FROM lianshufeng/meet-jitsi:base

LABEL org.opencontainers.image.title="Jitsi Meet"
LABEL org.opencontainers.image.description="WebRTC compatible JavaScript application that uses Jitsi Videobridge to provide high quality, scalable video conferences."
LABEL org.opencontainers.image.url="https://jitsi.org/jitsi-meet/"
LABEL org.opencontainers.image.source="https://github.com/jitsi/docker-jitsi-meet"
LABEL org.opencontainers.image.documentation="https://jitsi.github.io/handbook/"

ADD https://raw.githubusercontent.com/acmesh-official/acme.sh/3.0.7/acme.sh /opt
COPY rootfs/ /

RUN apt-dpkg-wrap apt-get update && \
    apt-dpkg-wrap apt-get install -y dnsutils cron nginx-extras jitsi-meet-web socat curl jq && \
    mv /usr/share/jitsi-meet/interface_config.js /defaults && \
    rm -f /etc/nginx/conf.d/default.conf && \
    apt-cleanup

EXPOSE 80 443

VOLUME ["/config", "/usr/share/jitsi-meet/transcripts"]


# ============================================================
# Custom extension section: Disable recording notification sounds
# ============================================================

RUN set -eux; \
    apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    SOUND_DIR="/usr/share/jitsi-meet/sounds" && \
    mkdir -p "$SOUND_DIR" && \
    # Generate 1-second silent MP3 file (using libmp3lame encoder)
    ffmpeg -f lavfi -i anullsrc=r=44100:cl=mono -t 1 -q:a 9 -acodec libmp3lame "$SOUND_DIR/silent.mp3" && \
    # Replace notification sounds
    cp "$SOUND_DIR/silent.mp3" "$SOUND_DIR/recordingOn.mp3" && \
    cp "$SOUND_DIR/silent.mp3" "$SOUND_DIR/recordingOff.mp3" && \
    # Clean up temporary files
    apt-get purge -y ffmpeg && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
	
# ============================================================
# End
# ============================================================

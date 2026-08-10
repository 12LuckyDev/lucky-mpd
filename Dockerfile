FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    mpd \
    alsa-utils \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY mpd.conf /etc/mpd.conf

CMD ["mpd", "--no-daemon", "/etc/mpd.conf"]
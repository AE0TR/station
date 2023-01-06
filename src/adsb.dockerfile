FROM sdr:tools

RUN apk add --no-cache \
    mosquitto-clients \
    socat

COPY ./adsb.sh /entrypoint.sh


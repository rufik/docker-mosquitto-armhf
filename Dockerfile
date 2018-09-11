FROM resin/armhf-alpine

LABEL Description="Eclipse Mosquitto MQTT Broker for armhf"

RUN apk update
RUN apk --no-cache add mosquitto mosquitto-clients

RUN adduser --system --disabled-password --disabled-login mosquitto

COPY config /mqtt/config

RUN [ "cross-build-end" ]

VOLUME ["/mqtt/config", "/mqtt/data"]

EXPOSE 1883 9001
CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]

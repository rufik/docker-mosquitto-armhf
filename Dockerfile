FROM resin/armhf-alpine

LABEL Description="Eclipse Mosquitto MQTT Broker for armhf"

RUN [ "cross-build-start" ]

RUN apk update
RUN apk --no-cache add mosquitto mosquitto-clients

COPY config /mqtt/config

RUN [ "cross-build-end" ]

VOLUME ["/mqtt/config", "/mqtt/data"]
EXPOSE 1883 9001
CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]

FROM balenalib/armv7hf-alpine:3.8

LABEL Description="Eclipse Mosquitto MQTT Broker for armhf"

RUN [ "cross-build-start" ]

RUN apk --no-cache add mosquitto mosquitto-clients

RUN [ "cross-build-end" ]

VOLUME ["/mqtt/config", "/mqtt/data", "/mqtt/log"]
EXPOSE 1883 9001
CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]

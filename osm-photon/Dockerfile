FROM alpine:3.13 AS builder

RUN apk update \
    && apk add wget curl sed grep bash \
    && rm -rf /var/cache/apk/*

COPY downloadphoton.sh /
RUN /downloadphoton.sh


FROM openjdk:8-alpine
COPY --from=0 /photon.jar /data/photon.jar
EXPOSE 2322
WORKDIR /data
ENTRYPOINT ["java", "-jar", "/data/photon.jar"]

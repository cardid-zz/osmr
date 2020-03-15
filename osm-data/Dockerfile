FROM alpine

RUN apk update \
      && apk add wget bash \
      && rm -rf /var/cache/apk/*

COPY run.sh /

ENTRYPOINT ["/run.sh"]

CMD []

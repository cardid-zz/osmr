FROM mediagis/nominatim:3.5

RUN apt-get update \
 && apt-get install -y wget \
 && rm -rf /var/lib/apt/lists/*

COPY run.sh /

ENTRYPOINT ["/run.sh"]

CMD []

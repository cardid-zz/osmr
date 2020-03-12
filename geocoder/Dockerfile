FROM mediagis/nominatim

RUN apt-get update \
 && apt-get install -y wget \
 && rm -rf /var/lib/apt/lists/*


COPY local.php /app/src/build/settings/local.php
COPY run.sh /

ENTRYPOINT ["/run.sh"]

CMD []

EXPOSE 7070

FROM ghcr.io/project-osrm/osrm-backend:v5.27.1

RUN apt-get update \
 && apt-get install -y wget \
 && rm -rf /var/lib/apt/lists/*


COPY run.sh /

ENTRYPOINT ["/run.sh"]

CMD []

EXPOSE 5000

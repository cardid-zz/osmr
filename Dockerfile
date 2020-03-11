FROM osrm/osrm-backend

RUN apt-get update && \
    apt-get install -y wget

COPY run.sh /

ENTRYPOINT ["/run.sh"]

CMD []

EXPOSE 5000

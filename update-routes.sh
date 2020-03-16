#!/bin/bash

set -x

docker-compose up osm-data &&
docker-compose up osm-routes-import &&
docker-compose restart osm-routes

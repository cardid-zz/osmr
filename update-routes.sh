#!/bin/bash

set -x
dir=$(dirname "$0")
cd $dir

docker-compose up osm-data &&
docker-compose up osm-routes-import &&
docker-compose restart osm-routes

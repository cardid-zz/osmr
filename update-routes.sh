#!/bin/bash

set -x
dir=$(dirname "$0")
cd $dir

/usr/local/bin/docker-compose up osm-data &&
/usr/local/bin/docker-compose up osm-routes-import &&
/usr/local/bin/docker-compose restart osm-routes

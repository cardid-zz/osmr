#!/bin/bash

set -x

function tryToImportPBF() {
  if [ ! -f /data/data.osm.pbf ] && [ -z "$DOWNLOAD_PBF" ]; then
    echo "WARNING: No import file at /data/data.osm.pbf"
    exit 1
  fi

  if [ -n "$DOWNLOAD_PBF" ]; then
    echo "INFO: Download PBF File: $DOWNLOAD_PBF"
    wget -nv "$DOWNLOAD_PBF" -O /data/data.osm.pbf
  fi

  osrm-extract -p /opt/car.lua /data/data.osm.pbf
  osrm-partition /data/data.osm.pbf
  osrm-customize /data/data.osm.pbf
}

if [ "$#" -ne 1 ]; then
  echo "usage: <import|run>"

  exit 1
fi

if [ "$1" = "import" ]; then
  tryToImportPBF

  exit 0
fi

if [ "$1" = "run" ]; then
  osrm-routed --algorithm mld /data/data.osm.pbf
  exit 0
fi

echo "invalid command"
exit 1

#!/bin/bash

set -x

function tryToImportPBF() {
  if [ ! -f /tmp/data.osm.pbf ] && [ -z "$DOWNLOAD_PBF" ]; then
    echo "WARNING: No import file at /tmp/data.osm.pbf"
    exit 1
  fi

  if [ -n "$DOWNLOAD_PBF" ]; then
    echo "INFO: Download PBF File: $DOWNLOAD_PBF"
    wget -nv "$DOWNLOAD_PBF" -O /tmp/data.osm.pbf
  fi

  osrm-extract -p /opt/car.lua /tmp/data.osm.pbf
  osrm-partition /tmp/data.osm.pbf
  osrm-customize /tmp/data.osm.pbf
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
  tryToImportPBF
  osrm-routed --algorithm mld /tmp/data.osm.pbf
  exit 0
fi

echo "invalid command"
exit 1

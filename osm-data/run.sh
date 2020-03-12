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
}

if [ "$#" -ne 1 ]; then
  echo "usage: <import|run>"

  exit 1
fi

if [ "$1" = "import" ]; then
  tryToImportPBF

  exit 0
fi

echo "invalid command"
exit 1

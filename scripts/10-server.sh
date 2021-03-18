#!/bin/bash

if [[ -z "$ALTV_BRANCH" ]]; then
  echo "Missing build arg ALTV_BRANCH!"
  exit 1
elif [[ -z "$ALTV_VERSION" ]]; then
  echo "Missing build arg ALTV_VERSION!"
  exit 2
fi

readonly API_URL_PREFIX="https://altv-pkgr.kldzj.dev/api/pkg"

mkdir -p /opt/altv

# modules
include="js"
if [ "$ALTV_CS" == "true" ]; then
  include+=",cs"
fi

# download server archive
readonly API_URL="$API_URL_PREFIX?branch=$ALTV_BRANCH&arch=x64_linux&version=${ALTV_VERSION}&include=$include"
wget "$API_URL" -O /opt/altv/altv-server.zip
if [[ $? -ne 0 ]]; then
  echo "Failed to wget server archive: $?"
  exit 3
fi

unzip /opt/altv/altv-server.zip -d /opt/altv/

#!/bin/bash

# remove server archive
rm /opt/altv/altv-server.zip

# remove unused dependencies
apt-get purge -y wget unzip

if [ "$ALTV_CS" == "true" ]; then
  apt-get purge -y wget gnupg
fi

apt autoremove -y
apt-get clean

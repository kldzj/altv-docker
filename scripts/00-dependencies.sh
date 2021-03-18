#!/bin/bash

apt-get update
apt-get install -y wget unzip libatomic1 libc-bin

if [ "$ALTV_CS" == "true" ]; then
  apt-get install -y gnupg
  wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  dpkg -i packages-microsoft-prod.deb
  rm -f packages-microsoft-prod.deb
  apt-get update
  apt-get -y install apt-transport-https dotnet-runtime-3.1 dotnet-runtime-5.0
  mkdir -p /usr/share/dotnet/host/fxr/
fi

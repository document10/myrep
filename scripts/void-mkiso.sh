#!/usr/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Must run as root,exiting..."
  exit
fi
xbps-install -Syu
xbps-install liblz4 qemu-user-static
git clone https://github.com/void-linux/void-mklive

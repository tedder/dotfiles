#!/bin/sh
if [ ! -d /Volumes/sda2 ]; then
  echo "mounting dir"
  mount_smbfs //@192.168.1.1/sda2 /Volumes/sda2
fi

rsync --exclude "Various*" --exclude "Raven*" --exclude "NWoBHM*" --exclude "saxon*" --exclude "*meta" --checksum --partial --progress --recursive seedbox2:/opt/torrent-files/downloads/*  /Volumes/sda2/vids/

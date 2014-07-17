#!/bin/sh
rsync --exclude "Various*" --exclude "Raven*" --exclude "NWoBHM*" --exclude "saxon*" --exclude "*meta" --checksum --partial --progress --recursive seedbox2:/opt/torrent-files/downloads/*  ~/Downloads/


#!/bin/bash -exv

#mkdir -p ~/Downloads/yt
/mnt/qnas/videos/yt-cookies.py > /mnt/qnas/videos/.youtube-cookies.txt
youtube-dl --config-location /mnt/qnas/videos/.yt.conf --batch-file /mnt/qnas/videos/.youtube.txt
if [ "$1" == "subs" ]; then
  echo "running subs too"
  youtube-dl --config-location /mnt/qnas/videos/.yt.conf --dateafter 20200301 --batch-file /mnt/qnas/videos/.youtube_channels.txt --ignore-errors
fi
# --ignore-errors
# -v --print-traffic

#youtube-dl --abort-on-error --download-archive /Users/ted/Downloads/yt/.ytlist \
#  --batch-file /Users/ted/Downloads/yt/youtube.txt \
#  -o "/Users/ted/Downloads/yt/%(upload_date)s-%(title)s-%(uploader)s-%(duration)ssec-%(width)sx%(height)s-%(id)s.%(ext)s" \
#  --restrict-filenames --format '[height=720]/[height>=720]/bestvideo+bestaudio/best'

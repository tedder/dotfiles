#!/bin/bash -exv

mkdir -p ~/Downloads/yt
youtube-dl --abort-on-error --batch-file /Users/ted/Dropbox/_evernote/youtube.txt
# -v --print-traffic

#youtube-dl --abort-on-error --download-archive /Users/ted/Downloads/yt/.ytlist \
#  --batch-file /Users/ted/Downloads/yt/youtube.txt \
#  -o "/Users/ted/Downloads/yt/%(upload_date)s-%(title)s-%(uploader)s-%(duration)ssec-%(width)sx%(height)s-%(id)s.%(ext)s" \
#  --restrict-filenames --format '[height=720]/[height>=720]/bestvideo+bestaudio/best'

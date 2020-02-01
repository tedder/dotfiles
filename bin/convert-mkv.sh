#!/bin/bash

#ffmpeg -i $1 -itsoffset -0.2 -i $1 -vcodec copy -acodec copy -map 0:0 -map 1:1 $1.mp4
#ffmpeg -i $1 -itsoffset -0.2 -i $1 -c:v libx264 -acodec copy -map 0:0 -map 1:1 $1.mp4

# HEVC
ffmpeg -i $1 -c:v libx265 -preset medium -crf 25 -vtag hvc1 -c:a aac -b:a 256k -ac 2 $1.mov

# add subtitles (bakes them into the image)
#ffmpeg -i $1 -vf subtitles=$1 -acodec copy $1.mp4

#!/bin/bash

ffmpeg -i $1 -vf scale=320:-1 -r 3 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - gif:- | convert -layers Optimize - $1.gif

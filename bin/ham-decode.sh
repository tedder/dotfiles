#!/bin/bash

GAIN=0
if [ "$2" ]; then
  echo "gain: $2"
  GAIN=$2
fi

sox -t ogg $1 -esigned-integer -b16 -t raw -r 22050 - gain $GAIN | ~/git/multimon-ng/build/multimon-ng -c -a MORSE_CW -a AFSK1200 -a AFSK2400 -a AFSK2400_2 -a AFSK2400_3 -a FSK9600 -t raw -

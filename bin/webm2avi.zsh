#!/usr/bin/env zsh

for i in *(.)webm; ffmpeg -i $i  ${i:r}.avi



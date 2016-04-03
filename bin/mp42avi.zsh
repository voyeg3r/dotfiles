#!/usr/bin/env zsh

# for i in *(.)mp4;  ffmpeg -i $i -codec copy ${i:r}.avi

for i in *(.)mp4; [[ ! -f ${i:r}.avi ]] &> /dev/null || for i in *(.)mp4; \
ffmpeg -i $i -codec copy ${i:r}.avi


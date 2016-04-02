#!/usr/bin/env zsh

for i in *(.)mp4; ffmpeg -i $i -codec copy ${i:r}.avi

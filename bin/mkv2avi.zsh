#!/usr/bin/env zsh
# Convert all mkv files to avi in current folder

for i in *(.)mkv; ffmpeg -i $i -vcodec mpeg4 -b 4000k -acodec mp2 -ab 320k ${i:r}.avi


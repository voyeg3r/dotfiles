#!/bin/bash
# Filename: screencast_pulse.sh
# Last Change: Wed, 07 Sep 2022 11:32:51

#Picks a file name for the output file based on availability:

if [[ -f ~/output.mkv ]]
	then
		n=1
		while [[ -f $HOME/output_$n.mkv ]]
		do
			n=$((n+1))
		done
		filename="$HOME/output_$n.mkv"
	else
		filename="$HOME/output.mkv"
fi

#The actual ffmpeg command:

ffmpeg -y \
-f x11grab \
-s $(awk '/dimensions/ {print $2}' <(xdpyinfo)) \
-i :0.0 \
 -f pulse -ac 1 -ar 44100 -i 3 \
 -c:v libx264 -r 30 -c:a flac $filename
 #-c:v ffvhuff -r 30 -c:a flac $filename


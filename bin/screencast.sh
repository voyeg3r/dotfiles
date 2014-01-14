#!/bin/bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2014 Jan 14 12:48:54
# THIS SCRIPT AIMS: record screencast
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================



ffmpeg -f alsa -ac 2 -i default -f x11grab -r 15 -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -s 1366x768 -i :0.0 -acodec pcm_s16le -vcodec libx264 -preset ultrafast -threads 0 out.mkv



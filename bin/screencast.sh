#!/bin/bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2014 Jan 14 14:11:05
# THIS SCRIPT AIMS: record screencast
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

# mplayer -tv driver=v4l2:width=320:height=240: -vo xv tv:// -geometry "99%:95%" -ontop


#ffmpeg -f alsa -ac 2 -i default -f x11grab -r 15 -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -s 1366x768 -i :0.0 -acodec pcm_s16le -vcodec libx264 -preset ultrafast -threads 0 out.mkv


ffmpeg -f alsa -ac 2 -i default -f x11grab -r 15 -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -s 1366x768 -i :0.0 -acodec pcm_s16le -vcodec libx264 -preset ultrafast -threads 0 out.mkv


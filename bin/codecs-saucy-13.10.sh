#!/bin/bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2013 Nov 02 07:17:12
# THIS SCRIPT AIMS: install programs and resources in ubuntu 13.10 'saucy'
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# =================================================

installgnomeplaymusic () {
# how install gnome-play-music
# source: http://gmpc.wikia.com/wiki/Installation_GMPC_Ubuntu
sudo add-apt-repository ppa:gmpc-trunk/gmpc-stable
sudo apt-get update && sudo apt-get install gmpc gmpc-plugins
} && installgnomeplaymusic





#!/bin/bash
# Criado em:Qua 07/Out/2009 hs 10:47
# Last Change: 2012 Out 07 08:24:17
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: consertar nome das pastas no ubuntu
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

# função será executada se o for usuário comum
pessoal (){
FILE=~/.config/user-dirs.dirs

# backup
echo "criando backup de $FILE"
sleep 1
cp $FILE{,.backup}

cat <<-EOF > $FILE
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.

XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/docs/downloads"
XDG_TEMPLATES_DIR="$HOME/docs/modelos"
XDG_PUBLICSHARE_DIR="$HOME/docs/share"
XDG_DOCUMENTS_DIR="$HOME/docs"
XDG_MUSIC_DIR="$HOME/docs/musicas"
XDG_PICTURES_DIR="$HOME/img"
XDG_VIDEOS_DIR="$HOME/docs/videos"

EOF

}


# função "geral" será executada se for root
geral () {

FILE=/etc/xdg/user-dirs.defaults

# backup
cp $FILE{,.backup}
echo "criando backup de $FILE"
sleep 1

cat <<-EOF > $FILE
# Default settings for user directories
#
# The values are relative pathnames from the home directory and
# will be translated on a per-path-element basis into the users locale
DESKTOP=Desktop
DOWNLOAD=docs/downloads
TEMPLATES=docs/modelos
PUBLICSHARE=docs/publico
DOCUMENTS=docs
MUSIC=docs/musica
PICTURES=docs/img
VIDEOS=docs/videos
# Another alternative is:
#MUSIC=Documents/Music
#PICTURES=Documents/Pictures
#VIDEOS=Documents/Videos
EOF

}


 [ "$(id -u)" != "0" ] && pessoal || geral

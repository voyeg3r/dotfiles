#!/data/data/com.termux/files/usr/bin/bash
# 4/05/2017 Gabi Tiplea
# changed by Sérgio Araujo

# filename: settermux.sh
# Download: wget -c https://bitbucket.org/sergio/dotfaster/raw/master/algorithm/shell/bash/settermux.sh -O settermux.sh

echo -e "Updating default packages"
apt update && apt -y upgrade

echo -e "Requesting acces to storage"
[ ! -d ~/storage ] && termux-setup-storage
sleep 5

echo -e "Installing python"
! command -v python &> /dev/null && apt install python

echo -e "Installing youtube-dl"
! command -v youtube-dl &> /dev/null && pip install youtube-dl

echo -e "Creating the Youtube folder to download the files"
[ ! -d ~/storage/shared/Youtube ] && mkdir -p ~/storage/shared/Youtube


[ ! -d ~/.config/youtube-dl ] && mkdir -p ~/.config/youtube-dl; echo -e "Created youtube-dl config folder"

[ ! -d ~/bin ] && mkdir ~/bin ; echo -e "Created ~/bin folder"

echo -e "Downloading and installing termux-url-opener"
wget -c https://bitbucket.org/sergio/dotfaster/raw/master/dotfaster/algorithm/shell/bash/termux-url-opener -O ~/bin/termux-url-opener

echo -e ""
echo -e ""
echo -e "Downloaded Files will be found in Youtube Folder in internal storage "
echo -e ""
echo -e "Copyright 2017 Gabi Tiplea, modified by insanetechvideos"

# vim:set et sw=4 ts=4 cole=0 ft=sh:

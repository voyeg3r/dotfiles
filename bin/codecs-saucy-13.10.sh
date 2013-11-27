#!/bin/bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2013 Nov 27 05:42:03
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

unhidestartupapplications (){
# Como ver as entradas ocultas do arranque do Ubuntu?
# fonte: http://ubuntued.info/como-ver-as-entradas-ocultas-do-arranque-do-ubuntu?
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
# só para garantir vamos voltar para a pasta padrão
cd
} && unhidestartupapplications


installflashplayer () {
#wget -c https://www.dropbox.com/s/t3yymfkpus89jqv/libflashplayer.so?dl=1 -O libflashplayer.so && sudo cp libflashplayer.so /usr/lib/mozilla/plugins/
#sudo apt-fast install -y flashplugin-installer gsfonts-x11
apt-fast install -y gnash gnash-common gnash-cygnal gnash-tools mozilla-plugin-gnash
} && installflashplayer

consertabrilho () {
# references: http://ubuntuforums.org/showthread.php?t=1742352
# http://stereopsis.com/flux/ # where I am? http://stereopsis.com/flux/map.html
# sudo wget -c https://www.dropbox.com/s/f837y509u68jdz7/xflux?dl=1 -O /usr/bin/xflux && sudo chmod +x $_
# this coordenates are to Quixeramobim -- to get your location visit: http://stereopsis.com/flux/map.html
# xflux -l 5.1981 -g -39.2962
# consertando o ajuste do brilho do monitor em computadores acer no ubuntu 13.04
# source: http://mauriciopessoablog.blogspot.com.br/2013/04/resolvido-corrigir-problema.html
sudo sed -i.backup -r '/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/=.*/="quiet splash pcie_aspm=force acpi_backlight=vendor"/g' /etc/default/grub
sudo update-grub
} && consertabrilho

showicons () {
# to display icons in ubuntu 12.04 precise pangolin do this
# source: http://www.ubuntugeek.com/hhow-to-display-computerhomenetworktrash-and-mounted-volumes-icons-on-ubuntu-12-04-precise-desktop.html
gsettings set org.gnome.desktop.background show-desktop-icons true
# gsettings set org.gnome.nautilus.desktop computer-icon-visible true
gsettings set org.gnome.nautilus.desktop home-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-visible true
gsettings set org.gnome.nautilus.desktop volumes-visible true
gsettings set org.gnome.nautilus.preferences click-policy 'single'
} && showicons

gnomesettings (){
# to set idle timeout until dim screen (the value must be in secconds)
gsettings set org.gnome.settings-daemon.plugins.power idle-dim-time 20
# to capture sound in Ctrl+shift+alt+r

# to reset default value to video record resource
gsettings reset org.gnome.shell.recorder pipeline
# improve speed of animations
sudo sed -i.backup '/const ANIMATION_TIME/ s/\.[0-9]*/.001/g' /usr/share/gnome-shell/js/ui/overview.js
} && gnomesettings

installaptfast () {
sudo cp /etc/apt/sources.list{,.backup}
sudo add-apt-repository ppa:apt-fast/stable -y && sudo apt-get update && sudo apt-get install -y axel aria2 apt-fast
sudo apt-fast install -y synaptic aptitude aptoncd aptitude
} && installaptfast

installatex () {
sudo apt-fast install texlive texlive-latex-extra texlive-lang-portuguese
} && installatex

firefox-daily-build () {
    sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
    sudo apt-fast update
    sudo apt-fast -y install firefox-trunk
} && firefox-daily-build

zoomdesktop () {
apt-fast install -y python-xlib python-dbus git-core
cd
git clone https://github.com/tobiasquinn/gnome-shell-mousewheel-zoom.git
sudo -f mv gnome-shell-mousewheel-zoom/mousewheelzoom.py /usr/bin/
sudo chmod +x /usr/bin/mousewheelzoom.py
sudo mv gnome-shell-mousewheel-zoom/mousewheelzoom.py.desktop /etc/xdg/autostart/
rm -rf gnome-shell-mousewheel-zoom/
} && zoomdesktop

simplescreenrecorder (){
  # www.maartenbaert.be/simplescreenrecorder/
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-fast update
sudo apt-fast -y install simplescreenrecorder
} && simplescreenrecorder

networkimproviment () {
# see how mutch swapp ubuntu is using -- cat /proc/sys/vm/swap­pi­ness
sudo cp /etc/sysctl.conf{,.backup} && sudo wget -c https://gist.github.com/voyeg3r/368407/raw/ -O - > /etc/sysctl.conf && sysctl -p
command -v ethtool >/dev/null && apt-fast install -y ethtool
wget -c https://raw.github.com/gist/1261754 -O /etc/network/if-up.d/100Mbs && chmod +x $_
} && networkimproviment

cleartrash (){
# limpeza automática da lixeira no ubuntu
# http://helpdeskgeek.com/linux-tips/automatically-empty-the-trash-in-ubuntu/
sudo add-apt-repository ppa:bneijt/ppa && sudo apt-fast update && sudo apt-fast --force-yes install autotrash
# to add autotrash task to every day do this
# crontab -e
# @daily /usr/bin/autotrash -d 30
} && cleartrash

installaudiorec () {
sudo apt-add-repository ppa:osmoma/audio-recorder
sudo apt-fast update && sudo apt-fast -y install audio-recorder
} && installaudiorec

sudo apt-fast install -y gnome-tweak-tool

installdeluge () {
sudo add-apt-repository ppa:deluge-team/ppa
sudo apt-fast update
sudo apt-fast -y install deluge
} && installdeluge

sudo apt-fast install -y youtube-dl && youtube-dl -U

# cliente webdav to 4shared
# cadaver http://webdav.4shared.com/
# cd folder
# mget *.ogv
sudo apt-fast install -y cadaver

installgraphicsapplications () {
sudo apt-fast install -y gmic gimp-data-extras gimp-plugin-registry inkscape shotwell nautilus-image-converter imagemagick gimp-resynthesizer libgimp2.0-dev ghostscript pdftk xclip xsel xsane
} && installgraphicsapplications

installvlc () {
sudo add-apt-repository ppa:videolan/stable-daily && sudo apt-fast update && sudo apt-fast install -y vlc* mozilla-plugin-vlc browser-plugin-vlc
} && installvlc

googletalkplugin () {
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-fast update
sudo apt-fast install -y google-talkplugin
} && googletalkplugin

installfonts () {
[ -d ~/.fonts ] || mkdir ~/.fonts && wget -c https://www.dropbox.com/sh/hwcjzmyrgbx71sk/ti6miLbAMw?dl=1 -O fonts.zip && unzip -j $_ -d ~/.fonts && rm -rf fonts.zip
# http://www.ubuntugeek.com/typecatcher-download-google-webfonts-2.html
sudo add-apt-repository ppa:andrewsomething/typecatcher
sudo apt-fast update
sudo apt-fast -y install typecatcher
fc-cache -fv
} && installfonts

confvim (){
sudo apt-fast -y install vim-gnome vim-doc
sudo apt-fast -y install aspell-pt-br
sudo apt-fast install -y mercurial
hg clone https://bitbucket.org/sergio/vimfiles .vim
rm -f .bashrc
rm -f .inputrc
ln -s ~/.vim/inputrc ~/.inputrc
ln -s ~/.vim/bashrc ~/.bashrc
ln -s ~/.vim/pythonstartup ~/.pythonstartup
ln -s ~/.vim/vimrc ~/.vimrc

cat <<-EOF > ~/.hgrc
[ui]
ssh = ssh -i ~/.ssh/id_rsa.pub -C
username = sergio silva <voyeg3r@gmail.com>
editor = vim
[paths]
default = ssh://hg@bitbucket.org/sergio/vimfiles
EOF
} && confvim

# compactadores
sudo apt-fast --force-yes install arj cabextract file-roller mpack p7zip p7zip-full p7zip-rar rar sharutils unace unace-nonfree unrar unzip uudeview zip

# admin tools
sudo apt-fast install -y openssh-server sshfs nmap iptstate iptraf nfs-common nfs-kernel-server portmap moreutils zsync curl libcurl3 python-pycurl ngrep arp-scan nautilus-open-terminal mercurial checkinstall gparted unetbootin upx-ucl

sudo apt-fast install -y unetbootin gparted openssh-client

installaudacious () {
# fork do songbird: http://getnightingale.com/
# http://sourceforge.net/projects/ngale/?source=dlp
sudo apt-fast install -y audacious audacious-plugins
} && installaudacious




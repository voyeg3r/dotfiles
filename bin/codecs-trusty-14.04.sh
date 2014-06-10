#!/bin/env bash
# Arquivo: codecs trusty 14.04
# Criado: Ter 10/Jun/2014 hs 14:05
# Last Change: Ter Jun 10, 2014  04:38
# autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# email: <voyeg3r  gmail.com>

# references:
# https://github.com/voyeg3r/dotfiles/blob/master/bin/codecs-precise.sh

# backup sources.list
sudo cp /etc/apt/sources.list{,.backup}

fixetchosts () {
[ "`awk 'NR==1 {print $NF}' /etc/hosts`" == "`hostname`" ] || \
sed -i "1s/\(.*\)/\1 `hostname`/g" /etc/hosts
} && fixetchosts

# disabling some consoles
sudo sed -i '/ACTIVE_CONSOLES/s/1-6/1-2/g' /etc/default/console-setup
sudo apt-get install -y zram-config

ubuntuafterinstall (){
# to run the program run: ubuntu-after-install
# source: http://www.edivaldobrito.com.br/como-instalar-o-ubuntu-install-ubuntu-14-04-e-derivados/
sudo add-apt-repository ppa:thefanclub/ubuntu-after-install
sudo apt-get update
sudo apt-get install -y ubuntu-after-install
} && ubuntuafterinstall

firefoxnightly (){
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
sudo apt-get update
sudo apt-get -y install firefox-trunk
} && firefoxnightly

synapselauncher (){
# install synapse application launcher
# reference: http://askubuntu.com/questions/449285/is-synapse-application-launcher-available
sudo apt-add-repository ppa:synapse-core/testing
sudo apt-get update
sudo apt-get install -y synapse
} && synapselauncher

installgit (){
# source: https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-14-04
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
} && installgit

installxclip (){
sudo apt-get -y install xclip
} && installxclip

# how generate new ssh key
# https://help.github.com/articles/generating-ssh-keys

installadmintools (){
wget -c https://raw.githubusercontent.com/voyeg3r/dotfiles/master/gitconfig -O ~/.gitconfig
sudo apt-get install -y zsh vim-gnome vim-doc curl nmap aria2 ethtool
# fasd
wget -c  https://github.com/clvv/fasd/tarball/1.0.1
tar zxvf 1.0.1 && cd 1.0.1
PREFIX=$HOME make install
} && installadmintools

escalonandodiscos (){
test -f /sys/block/sda/queue/scheduler && echo deadline > /sys/block/sda/queue/scheduler

test -f /sys/block/sdb/queue/scheduler && echo deadline > /sys/block/sdb/queue/scheduler

test -f /sys/block/hda/queue/scheduler && echo deadline > /sys/block/hda/queue/scheduler
} && escalonandodiscos

multimidia (){
sudo apt-get install -y audacity audacious audacious-plugins
sudo apt-get install -y ubuntu-restricted-extras vlc

sudo apt-get install gstreamer0.10-plugins-ugly libxine1-ffmpeg gxine mencoder libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 libavcodec-extra
} && multimidia


installaudiorec () {
sudo apt-add-repository ppa:osmoma/audio-recorder
sudo apt-get update && sudo apt-get -y install audio-recorder
} && installaudiorec

graphic (){
sudo apt-get install -y gimp inkscape imagemagick pdftk
} && graphic

changedesktop (){
# theme
[ -d ~/.themes ] || mkdir ~/.themes
wget -O faience_gnome_shell_theme.zip http://db.tt/3GSR2iOD
unzip faience_gnome_shell_theme.zip -d ~/.themes; rm faience_gnome_shell_theme.zip

# icons
[ -d ~/.icons ] || mkdir ~/.icons
wget -O faience_icon.zip http://db.tt/U5v4fQUx
unzip faience_icon.zip -d ~/.icons; rm faience_icon.zip

sudo apt-get install -y `apt-cache search gnome-icon-theme | awk '{print $1}'`
} && changedesktop


unhidestartupapplications (){
# Como ver as entradas ocultas do arranque do Ubuntu?
# fonte: http://ubuntued.info/como-ver-as-entradas-ocultas-do-arranque-do-ubuntu?
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
# só para garantir vamos voltar para a pasta padrão
cd
} && unhidestartupapplications


libreofficeptbr (){
sudo apt-fast -y install language-support-writing-pt aspell-pt-br myspell-pt-br ibrazilian iportuguese wportuguese libreoffice-l10n-pt-br
} && libreofficeptbr

sudo apt-get -y install deluge

installskype (){
sudo sh -c 'echo "deb http://archive.canonical.com/ quantal partner" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get -y install skype
} && installskype



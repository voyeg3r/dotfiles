# http://www.omgubuntu.co.uk/2017/04/things-to-do-after-installing-ubuntu-17-04

# aswita tweaks Is a Slimmer, Transparent Version of GNOME’s Adwaita Theme
# http://www.omgubuntu.co.uk/2017/06/adwaita-tweaks-theme

# Press Alt+F2 to bring up the Run dialog. Type gnome-session-properties. Click the "Add" button. In the resulting dialog box give the name as "Conky" and the command as conky. Click add and close.

# how install opera-developer on Ubuntu
# http://linuxg.net/install-opera-developer-on-ubuntu/

# fixing brithness control
# backup grub file:  sudo cp /etc/default/grub{,-backup}
# Edit the /etc/default/grub file.
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=vendor acpi_osi=Linux"



### remove noise during recordings
+ https://askubuntu.com/a/765024/3798



### install and set conky

    sudo apt-get install -y conky curl lm-sensors hddtemp

    sudo apt-get install -y wireshark

# how remove ppa repository
+ https://askubuntu.com/a/310/3798

    sudo apt-add-repository --remove ppa:whatever/ppa

As a safer alternative, you can install ppa-purge:

    sudo apt-get install ppa-purge

And then remove the PPA, downgrading gracefully packages it provided to packages provided by official repositories:

    sudo ppa-purge ppa_name

Note that this will uninstall packages provided by the PPA, but not those provided by the official repositories. If you want to remove them, you should tell it to apt:

    sudo apt-get purge package_name

You can also remove PPAs by deleting the .list files from /etc/apt/sources.list.d directory.

uniformicons (){
# http://www.noobslab.com/2017/01/uniform-icons-are-unshaped-but-looks.html
sudo add-apt-repository ppa:noobslab/icons2 -y
sudo apt-get update && sudo apt install -y uniform-icons
} && uniformicons

# united theme: https://www.gnome-look.org/p/1174889/

installpoptheme (){
# http://www.noobslab.com/2017/04/pop-theme-suite-make-your-ubuntulinux.html?m=1
sudo add-apt-repository ppa:noobslab/themes -y
sudo apt-get update && sudo apt-get install -y system76-pop-gtk-theme
sudo add-apt-repository ppa:noobslab/icons -y
sudo apt-get update && sudo apt-get install -y system76-pop-icon-theme
} && installpoptheme

lollypopinstall (){
# http://gnumdk.github.io/lollypop-web/
sudo add-apt-repository ppa:gnumdk/gnuppa -y
sudo apt-get update && sudo apt-get install lollypop -y
} && lollypopinstall

installppaurl (){
# A simple application to add PPA repository directly from web with a simple interface.
# http://www.omgubuntu.co.uk/2017/04/plotinus-hud-menu-search-gtk3-apps
sudo add-apt-repository ppa:atareao/ppaurl -y
sudo apt-get update && sudo apt install -y ppaurl
} && installppaurl

plotinusinstall () {
# A searchable command palette in every modern GTK+ application
# http://www.webupd8.org/2017/01/add-searchable-command-palette-to-any.html
# https://www.atareao.es/software-linux/paleta-de-comandos-aplicaciones-ubuntu/
# GTK3_MODULES=/usr/libi386-linux-gnu/libplotinus/libplotinus.so
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo apt update && sudo apt install -y libplotinus
} && plotinusinstall

fpat () {
# flatpat gtk theme
# https://github.com/nana-4/Flat-Plat
cd /tmp
curl -sL https://github.com/nana-4/Flat-Plat/archive/v20170605.tar.gz | tar xz
cd Flat-Plat-20170605 && sudo ./install.sh
} && fpat

# install folder color changer
apt://folder-color

sudo apt-get update
sudo apt-get install -y zsh
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip
pip3 install jupyter

sudo apt-get install -y conky-all

sudo apt install -y numix-gtk-theme
sudo apt install -y arc-theme

# app search
sudo apt install -y synapse

# set tracker preferences
# to run it: alt-f2 --> tracker-preferences
sudo apt install -y tracker-gui

greenrecord (){
# a new video recorder
sudo add-apt-repository ppa:mhsabbagh/greenproject -y
sudo apt update && sudo apt install -y green-recorder
} && greenrecord

papertheme (){
# read more here: https://snwh.org/paper
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt-get update
sudo apt-get install -y paper-icon-theme
sudo apt-get install -y paper-gtk-theme
sudo apt-get install -y paper-cursor-theme
} && papertheme

sudo apt-get install -y detox
sudo apt-get install -y sox
sudo apt-get install -y gnome-subtitles
sudo apt-get install -y epiphany-browser
sudo apt-get install -y deluge

# listen online radios
sudo apt-get install -y streamtuner2
sudo apt-get install -y gpodder

# soundcloud downloader
pip install soundscrape

sudo apt-get install -y curl

pip install beautifulsoup4
pip3 install beautifulsoup4
pip install requests
pip3 install wget

sudo apt install -y p7zip-full

sudo apt install -y gnome-screensaver

instaltldr(){
# easiest command explanations
# https://itsfoss.com/tldr-linux-man-pages-simplified/
# online: https://tldr.ostera.io/
sudo apt install -y nodejs npm
sudo npm install -g tldr
tldr --update
} && instaltldr

# language support
# https://www.vivaolinux.com.br/dica/Ubuntu-GNOME-1310-totalmente-em-portugues
sudo apt-get install language-selector-gnome

# command line radio player
sudo apt-get install -y cmus

vimwithpythonsuport (){
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
} && vimwithpythonsuport


sudo apt-get install -y git
sudo apt-get install -y vlc
sudo apt-get install -y youtube-dl
sudo apt-get install -y deluge

sudo apt install -y ubuntu-restricted-extras
sudo apt install libdvd-pkg && sudo dpkg-reconfigure libdvd-pkg


sudo apt-get install -y unrar
sudo apt-get install -y curl
sudo apt-get install -y tree

sudo apt-get install -y gimp inkscape
sudo apt-get install -y audacity

sudo apt-get install -y anki mplayer


# twitter client
sudo apt-get install -y corebird

sudo apt-get install xclip

ssh -T git@github.com

numixinstall (){
# source: http://www.edivaldobrito.com.br/mude-o-visual-instale-numix-icon-packs-ubuntu/
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme numix-icon-theme-circle
} && numixinstall

installadpatatheme () {
# http://www.omgubuntu.co.uk/2016/10/install-adapta-gtk-theme-on-ubuntu
sudo apt-add-repository ppa:tista/adapta -y
sudo apt-get update && sudo apt-get install -y adapta-gtk-theme
} && installadpatatheme

installaudiorecorder (){
sudo add-apt-repository ppa:audio-recorder/ppa
sudo apt-get -y update
sudo apt-get install --reinstall audio-recorder
} && installaudiorecorder


installspotify (){
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client
} && installspotify

createsimboliclinks () {
ln -sfvn ~/.dotfiles/rcfiles/vim/vimrc ~/.vimrc
ln -sfvn ~/.dotfiles/rcfiles/vim ~/.vim
ln -sfvn ~/.dotfiles/rcfiles/bashrc ~/.bashrc
ln -sfvn ~/.dotfiles/rcfiles/inputrc ~/.inputrc
ln -sfvn ~/.dotfiles/rcfiles/wgetrc ~/.wgetrc
ln -sfvn ~/.dotfiles/gitconfig ~/.gitconfig
ln -sfvn ~/.dotfiles/fonts.conf ~/.fonts.conf
ln -sfvn ~/.dotfiles/pythonstartup ~/.pythonstartup
ln -sfvn ~/.dotfiles/rcfiles/zsh/zshrc ~/.zshrc
ln -sfvn ~/.dotfiles/rcfiles/zsh/zshenv ~/.zshenv
ln -sfvn ~/.dotfiles/agignore ~/.agignore
[ ! -d ~/bin ] && ln -s ~/.dotfiles/bin ~/bin
} && createsimboliclinks






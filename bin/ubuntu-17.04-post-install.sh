# http://www.omgubuntu.co.uk/2017/04/things-to-do-after-installing-ubuntu-17-04

sudo apt-get update
sudo apt-get install -y zsh

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






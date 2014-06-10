#!/bin/bash
# codecs-raring.sh
# Criado: Sab 27/abr/2013 hs 16h
# Last Change: Ter Jun 10, 2014  04:18
# autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# email: <voyeg3r  gmail.com>
# baseado nos scripts https://gist.github.com/voyeg3r/3921102
# https://gist.github.com/1285188

#                ( O O )
# +===========oOO==(_)==OOo==============+

# see some tips here: https://wiki.archlinux.org/index.php/Gnome

bostsystem () {
sudo sed -i '/^ACTIVE_CONSOLES/ s/1-6/1-2/g' /etc/default/console-setup
} && bostsystem

supressingerromessages () {
# source: http://www.ubuntubrsc.com/desabilitando-a-janela-de-erro-do-sistema-no-ubuntu-12-04.html
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport && sudo service apport stop
} &&  supressingerromessages

stopterminals () {
# parando consoles (terminais) de 3 a 6
sudo rename 's/$/.bak/g' /etc/init/tty[3-6].conf
sudo sed -i.backup '/ACTIVE_CONSOLES=/s/1-6/1-2/g' /etc/default/console-setup
} && stopterminals

boost-gtk () {
# improvimentos on gtk
cat <<-EOF > ~/.gtkrc-2.0
gtk-menu-popup-delay = 0
gtk-menu-popdown-delay = 0
gtk-menu-bar-popup-delay = 0
gtk-timeout-expand = 0
gtk-timeout-initial = 0
EOF
} && boost-gtk

createwindowsbootable () {
# http://www.addictivetips.com/ubuntu-linux-tips/winusb-create-bootable-windows-installer-usb-in-ubuntu-linux/
# dica (use winusbgui)
sudo add-apt-repository ppa:colingille/freshlight
sudo apt-get update
sudo apt-get install winusb
}

# download da pasta bin
#cd ; wget -c https://www.dropbox.com/sh/7ezkwg05dao4if8/6azl8ngTfR?dl=1 -O bin.zip && unzip $_ && rm -rf bin.zip

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
apt-fast install -y gnash gnash-common gnash-cygnal gnash-tools  mozilla-plugin-gnash
} && installflashplayer

improveflashplayer () {
# melhorando o desempenho do flash
# http://pplware.sapo.pt/linux/3-dicas-para-melhorar-o-desempenho-do-flash-em-linux/
# This allows you to boost Flash by bypassing GPU validation. Eduardo tested it and said ‘the difference is noticeable.’
sudo mkdir /etc/adobe && echo "OverrideGPUValidation = 1" | sudo tee /etc/adobe/mms.cfg
[ -d ~/.adobe ] || mkdir ~/.adobe && echo OverrideGPUValidation=true >> ~/.adobe/mms.cfg
for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done
} && improveflashplayer

disableguestaccount () {
# disable guest account
[ -z `grep allow-guest=false /etc/lightdm/lightdm.conf 2>/dev/null` ] && sudo sed -i '$aallow-guest=false' /etc/lightdm/lightdm.conf
} && disableguestaccount

consertabrilho () {
# references: http://ubuntuforums.org/showthread.php?t=1742352
# http://stereopsis.com/flux/  # where I am? http://stereopsis.com/flux/map.html
# sudo wget -c https://www.dropbox.com/s/f837y509u68jdz7/xflux?dl=1 -O /usr/bin/xflux && sudo chmod +x $_
# this coordenates are to Quixeramobim -- to get your location visit:  http://stereopsis.com/flux/map.html
# xflux -l 5.1981 -g -39.2962
# consertando o ajuste do brilho do monitor em computadores acer no ubuntu 13.04
# source: http://mauriciopessoablog.blogspot.com.br/2013/04/resolvido-corrigir-problema.html
sudo sed -i.backup -r '/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/=.*/="quiet splash pcie_aspm=force acpi_backlight=vendor"/g'  /etc/default/grub
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
gsettings set org.gnome.shell.recorder pipeline "queue ! videorate ! vp8enc quality=10 speed=2 ! mux. pulsesrc ! audio/x-raw-int ! queue ! audioconvert ! vorbisenc ! mux. webmmux name=mux"

# to reset default value to video record resource
gsettings reset org.gnome.shell.recorder pipeline
}

# more control over startup applications
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

installaptfast () {
sudo cp /etc/apt/sources.list{,.backup}
sudo add-apt-repository ppa:apt-fast/stable -y && sudo apt-get update && sudo apt-get install -y axel aria2 apt-fast
sudo apt-fast install -y synaptic aptitude aptoncd aptitude
} && installaptfast

networkimproviment () {
# see how mutch swapp ubuntu is using -- cat /proc/sys/vm/swap­pi­ness
sudo cp /etc/sysctl.conf{,.backup} && sudo wget -c https://gist.github.com/voyeg3r/368407/raw/ -O - > /etc/sysctl.conf && sysctl -p
command -v ethtool >/dev/null && apt-fast install -y ethtool
wget -c https://raw.github.com/gist/1261754 -O /etc/network/if-up.d/100Mbs && chmod +x $_
} && networkimproviment

libreofficeptbr (){
sudo apt-fast -y install language-support-writing-pt aspell-pt-br myspell-pt-br ibrazilian iportuguese wportuguese libreoffice-l10n-pt-br
}

# alternative dns servers
#nameserver 208.67.222.222
#nameserver 208.67.220.220
#nameserver 202.51.5.52

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

installprofielsyncdaemon () {
# source: http://www.webupd8.org/2013/02/keep-your-browser-profiles-in-tmpfs-ram.html
sudo add-apt-repository ppa:graysky/utils
sudo apt-fast update
sudo apt-fast -y install profile-sync-daemon
browsers=`profile-sync-daemon parse | awk -F/ '/browser\/psname/ {print $3}'`
sudo sed -ir "s/^USERS=.*/USERS=\"`ls \/home`\"/g" /etc/psd.conf
read -p "O firefox será fechado: "
pkill firefox
} && installprofielsyncdaemon

# performance
sudo apt-fast install -y preload

# conversão de formatos de audio
sudo apt-fast install -y soundconverter

# ulatencyd - Daemon to minimize latency on a linux system using cgroups
sudo apt-fast install -y ulatencyd

setnumbworkspaces () {
# configurar um número de espaços de trabalho variável
sudo apt-fast install -y deconf-tools
gsettings set org.gnome.shell.overrides dynamic-workspaces true
}

installgnomesushi () {
# this application allow image preview, select image and hit space bar
sudo apt-fast install -y gnome-sushi
}

installaqualtheme () {
# references: http://www.noobslab.com/2011/10/beautiful-tron-legacy-and-aqua-themes.html
sudo add-apt-repository ppa:satyajit-happy/themes
sudo apt-fast update
sudo apt-fast install gnome-shell-theme-aqua
} && installaqualtheme

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

evernoteclient () {
# source: http://www.webupd8.org/2012/12/evernote-linux-client-everpad-available.html
# gnome-shell addon: https://extensions.gnome.org/extension/495/topicons/
sudo add-apt-repository ppa:nvbn-rm/ppa
sudo apt-fast update
sudo apt-fast -y install everpad
} && evernoteclient

installgnomedocuments (){
#http://www.webupd8.org/2011/10/install-gnome-documents-in-ubuntu-1110.html
sudo add-apt-repository ppa:webupd8team/gnome3
sudo apt-gfast update
sudo apt-fast -y install gnome-documents
tracker-control -s
} && installgnomedocuments

installgraphicsapplications () {
sudo apt-fast install -y gmic gimp-data-extras gimp-plugin-registry inkscape shotwell nautilus-image-converter imagemagick gimp-resynthesizer libgimp2.0-dev ghostscript pdftk xclip xsel xsane
} && installgraphicsapplications

installvlc () {
sudo add-apt-repository ppa:videolan/stable-daily && sudo apt-fast update && sudo apt-fast install -y vlc* mozilla-plugin-vlc browser-plugin-vlc
} && installvlc

sudo apt-fast install nautilus-dropbox


# ubuntu builder - create your own distro
# http://www.ubuntugeek.com/ubuntu-builder-2-3-0-released-and-installation-instructions-included.html
sudo add-apt-repository ppa:f-muriana/ubuntu-builder && sudo apt-fast update && sudo apt-fast install ubuntu-builder

# java
sudo apt-fast install openjdk-7* icedtea-7-plugin ca-certificates-java icedtea-7-jre-cacao icedtea-7-jre-jamvm java-common libatk-wrapper-java libatk-wrapper-java-jni libbonobo2-0 libbonobo2-common libgnome2-0 libgnomevfs2-0 libgnomevfs2-common openjdk-7-jre-headless openjdk-7-jre-lib ttf-dejavu-extra tzdata-java

# tidy - validate, correct, and pretty-print HTML files -
# tidy -i -xml <inputfile>
sudo apt-fast install tidy

boostfirefox () {
# daily version of firefox without overwriting stable version
# new theme: https://addons.mozilla.org/pt-br/firefox/addon/australis/
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa && sudo apt-fast update && sudo apt-fast --force-yes install firefox-trunk
sudo apt-fast install -y upx && sudo upx -9 /usr/lib/firefox-trunk/firefox-trunk
} && boostfirefox

# alterando a prioridade de algumas aplicações
# Add the following line above exit 0 in rc.local:
# renice -n -5 $(pidof X)

installopera () {
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-fast update
sudo apt-fast install opera
}

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

installcodecs () {
sudo wget http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list --output-document=/etc/apt/sources.list.d/medibuntu.list
sudo apt-get -q update
sudo apt-get --yes -q --allow-unauthenticated install medibuntu-keyring
sudo apt-get -q update
sudo apt-get --yes install app-install-data-medibuntu apport-hooks-medibuntu
sudo apt-get install w32codecs libdvdcss2 gstreamer1.0-libav gstreamer0.10*
sudo /usr/share/doc/libdvdread4/./install-css.sh
sudo apt-fast -y install regionset
sudo regionset
} && installcodecs

# compactadores
sudo apt-fast --force-yes install arj cabextract file-roller mpack p7zip p7zip-full p7zip-rar rar sharutils unace unace-nonfree unrar unzip uudeview zip

# ferramentas de administração
sudo apt-fast install -y openssh-server sshfs nmap iptstate iptraf nfs-common nfs-kernel-server portmap moreutils zsync curl libcurl3 python-pycurl ngrep arp-scan nautilus-open-terminal mercurial checkinstall gparted unetbootin upx-ucl

# how install tor browser
# http://www.ubuntugeek.com/how-to-install-tor-browser-bundle-in-ubuntu.html

sudo add-apt-repository ppa:tualatrix/ppa && sudo apt-fast update && sudo apt-fast install ubuntu-tweak

memoryimproviment () {
# this conf also add zram
grep ^tmpfs /etc/fstab || cat <<-EOF>> /etc/fstab
tmpfs /tmp tmpfs defaults,noexec,nosuid 0 0
tmpfs /var/tmp tmpfs defaults,noexec,nosuid 0 0
EOF
mount -a
sudo add-apt-repository ppa:shnatsel/zram && sudo apt-fast update && sudo apt-fast install zramswap-config -y
} && memoryimproviment

sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

sudo apt-fast install ubuntu-restricted-extras non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree

# multimedia mais recente ############################################
#  cannot install h.264 decoder: totem --> http://ubuntuforums.org/showthread.php?t=1502057
sudo apt-fast install libxine1-ffmpeg gxine mencoder mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 ffmpeg totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 libjpeg-progs flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview flac libmpeg3-1 mpeg3-utils mpegdemux liba52-0.7.4-dev libquicktime2 gstreamer-tools

totemshowthumbnails (){
# se o totem não exibir miniaturas
sudo apt-get install gstreamer-tools
rm -rf ~/.gstreamer-0.10/*
gst-inspect
} && totemshowthumbnails

sudo apt-get install gstreamer0.10-ffmpeg gstreamer0.10-fluendo-mp3 gstreamer0.10-gnonlin gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly totem-plugins-extra gstreamer-dbus-media-service gstreamer-tools ubuntu-restricted-extras ttf-mscorefonts-installer

# jdownloader
sudo add-apt-repository ppa:jd-team/jdownloader && sudo apt-fast update && sudo apt-fast install jdownloader -y

# create bootable usb drive
# ubuntu gnome-shell-remix
# http://ubuntu-gs-remix.sourceforge.net/p/home/
sudo apt-fast install -y unetbootin gparted openssh-client

installgnome-shell (){
sudo apt-fast install -y ubuntu-gnome-desktop ubuntu-gnome-default-settings
sudo dpkg-reconfigure gdm
sudo apt-get remove ubuntu-settings
sudo apt-fast -y install gnome-documents gnome-boxes
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get remove overlay-scrollbar*
} && installgnome-shell

# gnome-shell-mou­sewheel-zoom
# source: http://ubuntued.info/como-ter-o-efeito-zoom-com-a-roda-do-mouse-no-gnome-shell
sudo apt-add-repository -y ppa:tobias-quinn/gsmz && sudo apt-fast update && apt-fast -y install gnome-shell-mousewheel-zoom

installubuntutweak () {
# http://www.ubuntugeek.com/ubuntu-tweak-0-6-0-released-and-ubuntu-ppa-installation-instructions-included.html
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-fast update
sudo apt-fast install ubuntu-tweak
} && installubuntutweak

installaudacious () {
# fork do songbird: http://getnightingale.com/
# http://sourceforge.net/projects/ngale/?source=dlp
sudo apt-fast install -y audacious audacious-plugins
} && installaudacious

# another good audio player
# http://sayonara.luciocarreras.de/downloads.html

installtomahawk () {
# http://www.tomahawk-player.org/
sudo add-apt-repository ppa:tomahawk/ppa
sudo apt-fast update
sudo apt-fast install tomahawk
} && installtomahawk

installskype (){
sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu/ quantal partner' >> /etc/apt/sources.list.d/canonical_partner.list"
sudo apt-fast update && sudo apt-fast install -y skype
} && installskype

installfaenzaicontheme () {
sudo add-apt-repository ppa:tiheum/equinox
sudo apt-fast update
sudo apt-fast -y install gtk2-engines-equinox equinox-theme faenza-icon-theme
} && installfaenzaicontheme

installbrotherDCP7065DN () {
sudo apt-fast install brother*

# SCANNING
sudo apt-get install xsane sane-utils xsane-common
cd ~/Downloads
#wget http://pub.brother.com/pub/com/bsc/linux/dlf/brscan4-0.3.0-2.amd64.deb
wget http://www.brother.com/pub/bsc/linux/dlf/brscan4-0.4.1-3.i386.deb
sudo dpkg -i brscan4-0.4.1-3.i386.deb
sudo cp /usr/lib/sane/libsane-brother4.so.1.0.7 /usr/lib/sane/
sudo cp /usr/lib/sane/libsane-brother4.so /usr/lib/sane/
sudo cp /usr/lib/sane/libsane-brother4.so.1 /usr/lib/sane/
brsaneconfig4 -a name=DCP-7065DN model=DCP-7065DN nodename=`hostname`.local
# ...where drucksack is the local hostname of the printer/scanner ↑
# If you want if you want to specify your printer rather using its IP, run this instead:
#brsaneconfig4 -a name=DCP-7065DN model=DCP-7065DN ip=192.168.2.30

## PRINTING

sudo apt-get install cups csh lib32stdc++6
sudo mkdir /var/spool/lpd
sudo mkdir -p /usr/lib/cups/filter
sudo mkdir /usr/share/cups/model
sudo mkdir -p /usr/lib/cups/filter
cd ~/Downloads
wget http://pub.brother.com/pub/com/bsc/linux/dlf/dcp7065dnlpr-2.1.0-1.i386.deb
wget http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperDCP7065DN-2.0.4-2.i386.deb
sudo dpkg -i dcp7065dnlpr-2.1.0-1.i386.deb
sudo dpkg -i cupswrapperDCP7065DN-2.0.4-2.i386.deb
sudo cp /usr/lib/libbr* /usr/lib32/
sudo cp /usr/lib/cups/filter/brlpdwrapper* /usr/lib64/cups/filter
sudo cp /usr/lib/cups/filter/brlpdwrapper* /usr/lib/cups/filter
} && installbrotherDCP7065DN

# convert pdf to odt
apt-fast install xpdf kword

# quickly free diskspace
sudo apt-fast -y install bleachbit && sudo bleachbit

# conversor de documentos : http://johnmacfarlane.net/pandoc/
sudo apt-fast install -y pandoc


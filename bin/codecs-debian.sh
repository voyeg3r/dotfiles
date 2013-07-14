#!/bin/bash
# File:           Codecs and progs to debian linux
# Created:        Wednesday 1 may of 2013
# Las Change:     Wednesday 4 may of 2013 07:50

#                ( O O )
# +===========oOO==(_)==OOo==============+

# based in: https://gist.github.com/voyeg3r/5473634
# References:
# http://wiki.debian.org/MultimediaCodecs
# https://sites.google.com/site/mydebiansourceslist/
# http://sejalivre.org/o-que-fazer-apos-instalar-o-debian-passo-a-passo-da-pos-instalacao/

# firefox australis theme: https://addons.mozilla.org/en-us/firefox/addon/australis-redesigned/

# Excelente artigo do Lex Aleksandre sobre hardware não livre
# http://www.debianmaniaco.blogspot.com.br/2012/06/instalando-debian-com-firmware-nao.html

# à partir do squeezy se deixar a senha do root em branco o usuário padrão terá poderes sudo
# dica do Lex Aleksandre

# boa alternativa ao dropbox: http://sparkleshare.org/

# imagens do instalador
# http://cdimage.debian.org/debian-cd/7.0.0/
# http://cdimage.debian.org/debian-cd/7.0.0/i386/bt-dvd/

installtranslator () {
# command line translator
#https://github.com/Anoncheg1/Command-line-translator
#This tool for access translate.google.com from terminal and to have English dictionary
sudo apt-get install -y curl spidermonkey-bin html2text mpg123
wget -c https://raw.github.com/Anoncheg1/Command-line-translator/master/translate ~/bin && chmod +x $_
} && installtranslator

# definindo o instalador
sudo apt-get install -y prozilla apt-proz
command -v apt-proz >/dev/null && INSTALLER="apt-proz" || INSTALLER="apt-get"

# cliente twitter
sudo apt-proz install -y turpial

fixboottime-debian () {
# source: http://forums.debian.net/viewtopic.php?t=31275&highlight=speed+boot
# read also: http://wiki.debian.org/BootProcessSpeedup
apt-get install insserv
echo 'CONCURRENCY=shell' >> /etc/default/rcS
apt-get install readahead
apt-get install preload
touch  /.readahead_collect
}

installgit (){
# source: http://rogerdudler.github.io/git-guide/index.pt_BR.html
apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext  libz-dev libssl-dev git
} && installgit

changewallpaper () {
# http://dsathe.blogspot.com.br/2011/06/auto-background-changer-for-gnome-3-gui.html gnone3-wp
git clone git://gitorious.org/gnome-3-wp/gnome-3-wp.git
} && changewallpaper

updateiceweazel () {
echo "deb http://mozilla.debian.net/ wheezy-backports iceweasel-release" >> /etc/apt/sources.list
wget -q http://mozilla.debian.net/archive.asc -O- | sudo apt-key add -
sudo aptitude update
sudo aptitude  safe-upgrade
}

apt-get install -y update-notifier

installsnippy () {
# snippy: https://bbs.archlinux.org/viewtopic.php?id=71938
for i in xsel xdotool ; do
   [ -z "`command -v $i`" ] && apt-get install -y "$i"
done

[ ! -d ~/.snippy ] && mkdir ~/.snippy
echo 'Hello World!' > ~/.snippy/hw

[ ! -f ~/bin/snippy.sh ] && cat <<-EOF > ~/bin/snippy.sh
	#!/bin/bash
	# read the abbreviation
	xdotool key ctrl+shift+Left
	xdotool key ctrl+x
	sleep 0.2s # to work reliably in Firefox
	SELECTION=`xsel -b`
	# read snippet file
	xsel -b -i < ~/.snippy/${SELECTION}
	# paste snippet
	xdotool key ctrl+v
	xdotool key BackSpace # delete the last blank line, so we stay inline
EOF
}


# configurações do NetworkManager:
# http://wiki.debian.org/NetworkManager
# /etc/NetworkManager/NetworkManager.conf
# /etc/init.d/network-manager restart

# trying set up hotspot
# http://forums.debian.net/viewtopic.php?f=16&t=49136
#  sudo aptitude install hostapd

# http://sistemaoperacionalinux.blogspot.com.br/2013/04/diminuindo-o-tamanho-dos-icones-do.html

# bash tips:
# http://indlovu.wordpress.com/2010/07/26/useful-bash-functions/
# o3totxt !!!
# function o3() { unzip -p "$1" content.xml | o3totxt | utf8tolatin1; }

installdropbox () {
# como instalar o dropbox
# https://www.dropbox.com/install?os=lnx
if [ "`uname -m`" == "i686" ] ; then
      cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -
else
      cd ~ && wget -O - "http://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
fi
~/.dropbox-dist/dropboxd
}


fixetchosts () {
# https://snipt.net/voyeg3r/fix-etchosts-in-ubuntu/
[ "`awk 'NR==1 {print $NF}' /etc/hosts`" = "`hostname`" ] && echo '/etc/hosts already fixed!' || sed -i.backup -r "1s/(.*)/\1 `hostname`/g" /etc/hosts
} && fixetchosts

apt-get install -y cairo-dock cairo-dock-plug-ins

installfonts () {
[ -d ~/.fonts ] || mkdir ~/.fonts && wget -c https://www.dropbox.com/sh/hwcjzmyrgbx71sk/ti6miLbAMw?dl=1 -O fonts.zip && unzip -j $_ -d ~/.fonts && rm -rf fonts.zip
fc-cache -fv
} && installfonts

descompactadores () {
# http://www.rarlab.com/download.htm
if [ "$(id -u)" != "0" ] && echo "  Need be root" && sleep 3 &&  exit 1
[ "`dpkg -s build-essential | awk '/Status/ {print $4}'`" != "installed" ] && apt-get -y build-essential
wget -c http://www.rarlab.com/rar/rarlinux-4.2.0.tar.gz && tar zxvf rarlinux-4.2.0.tar.gz && cd rar && make
apt-get --force-yes install arj cabextract file-roller mpack p7zip p7zip-full unrar-free sharutils unace  unzip uudeview zip unrar-free
}

adminstrativetools () {
sudo apt-get install -y openssh-server sshfs nmap iptstate iptraf nfs-common nfs-kernel-server portmap moreutils zsync rsync curl libcurl3 python-pycurl ngrep arp-scan nautilus-open-terminal mercurial checkinstall gparted unetbootin testdisk fdupes reaver sysvconfig  build-essential spidermonkey prozilla apt-proz
}

installaircrack () {
# como hackear redes wifi: http://www.youtube.com/watch?v=2_3MpVoY4Cg
# http://www.aircrack-ng.org/doku.php?id=install_aircrack
# http://krazyk-world.blogspot.com.br/2011/07/aircrack-ng-en-debian-testing-wheezy.html
# http://packages.debian.org/sid/i386/aircrack-ng/download
wget -c http://ftp.de.debian.org/debian/pool/main/a/aircrack-ng/aircrack-ng_1.1-5_i386.deb && dpkg -i aircrack-ng_1.1-5_i386.deb
apt-get install -y reaver build-essential

}

installgraphicsapplications () {
sudo apt-get install -y gmic gimp-data-extras gimp-plugin-registry inkscape shotwell nautilus-image-converter imagemagick gimp-resynthesizer libgimp2.0-dev ghostscript pdftk xclip xsel xsane
} && installgraphicsapplications

instainsync () {
# http://debianmaniaco.blogspot.com.br/2012/10/google-drive-no-debian.html
# lsync is a google-docs client
# https://www.insynchq.com/
wget -O - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
[ -z "`grep -o http://apt.insynchq.com/debian /etc/apt/sources.list`" ] && \
echo 'deb http://apt.insynchq.com/debian wheezy non-free' >> /etc/apt/sources.list
apt-get update &&  apt-get install -y insync-beta-gnome
} && instainsync

installbootsplash () {
# instalando splash screen - tela de boot animada :
# http://debianmaniaco.blogspot.com.br/2011/08/boot-animado-no-debian-squeeze.html
sudo aptitude install plymouth plymouth-themes-all plymouth-x11 v86d
# para escolher o tema
# plymouth-set-default-theme -l
# plymouth-set-default-theme "nome-do-tema" --rebuild-initrd
plymouth-set-default-theme spacefun --rebuild-initrd
sed -i.backup -r '/GRUB_CMDLINE_LINUX_DEFAULT/ s/quiet/& splash/g' /etc/default/grup
sed -i.backup -r 's/^(#)(GRUB_GFXMODE).*/\2=1024x768/g' /etc/default/grub
update-grub2
} && installbootsplash

kernel39 () {
# http://debianmaniaco.blogspot.com.br/2013/04/instalando-o-kernel-39-no-debian.html
[ -z "`grep 'http://linux-libre.fsfla.org/pub/linux-libre/freesh/ 2> /dev/null' /etc/apt/sources.list`" ] && echo 'deb http://linux-libre.fsfla.org/pub/linux-libre/freesh/ freesh main' >> /etc/apt/sources.list
wget http://linux-libre.fsfla.org/pub/linux-libre/freesh/archive-key.asc && sudo apt-key add archive-key.asc
sudo aptitude update
sudo aptitude install linux-libre32-3.9
# caso queira remover o kernel use o comando abaixo para listar
# dpkg --list | grep linux-image
} && kernel39

installpfkernel () {
# http://sejalivre.org/aumentando-o-desempenho-do-ubuntu-e-debian-com-pf-kernel/
cd ~/Downloads
wget -c http://repos.natalenko.name/ubuntu/pf/linux-image-3.9.2-pf_1_i386.deb
sudo dpkg -i linux-image*.deb

# caso queira remover faça:
# sudo apt-get remove $(dpkg --get-selections | grep linux-.*pf | sed -e 's/-pf.*/-pf/g')
}

addppa () {
# source: http://debianmaniaco.blogspot.com.br/2012/02/script-para-adicionar-repositorios-ppas.html
wget -c https://gist.github.com/voyeg3r/5520774/raw/ -O /usr/sbin/add-apt-repository && \
chmod o+x $_ && chown root:roo $_
}

singlesourcelist () {
# solving sources.list issues
# http://http.debian.net/
cp /etc/apt/sources.list{,-backup}
cat <<-EOF > /etc/apt/sources.list
# http://debianmaniaco.blogspot.com.br/2013/05/usando-endereco-unico-para-os.html
deb http://http.debian.net/debian wheezy main
EOF
} && singlesourcelist

# ls sempre colorido
# http://www.vivaolinux.com.br/dica/Mantenha-o-ls-sempre-colorido : alias ls='ls --color=auto'

# como instalar o firefox verdadeiro
# http://superuser.com/questions/322376/how-to-install-real-firefox-on-debian
# how improve it: http://www.makeuseof.com/tag/tired-of-buffering-3-ways-to-speed-up-youtube/

installfirefoxtrunck () {
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
sudo apt-get update
sudo apt-get install -y firefox-trunk
}

installyoutubedl (){
# http://rg3.github.io/youtube-dl/download.html
sudo wget http://youtube-dl.org/downloads/2013.05.10/youtube-dl -O /usr/local/bin/youtube-dl && chmod +x $_
}

# como criar um atalho personalizado
# http://superuser.com/questions/476937/ctrlaltt-doesnt-open-a-terminal-in-cinnamon-1-6

improveperformance () {
# reference http://artipc10.vub.ac.be/wordpress/2011/05/27/linux-performance-improvements/
sync && echo 3 > /proc/sys/vm/drop_caches # limpa o cache da memória
if test -f /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
then
    echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
fi
cat <<-EOF> /etc/cron.hourly/renicefirefox
#!/bin/sh
# http://www.thegeekstuff.com/2009/06/15-practical-crontab-examples/
echo renice -p 15 \`pidof firefox\`
EOF
chmod +x /etc/cron.hourly/renicefirefox
} && improveperformance

sudo apt-get install -y sysv-rc-conf upx-ucl


installbrotherDCP7065DN () {
# aqui no trabalho tenho uma impressoras dessas e por isso uso este script
sudo apt-get install brother*

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

confvim (){
sudo apt-get -y install vim-gnome vim-doc
sudo apt-get -y install aspell-pt-br
sudo apt-get install -y mercurial
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

addaudacious () {
apt-get install -y audacious sox sudo apt-get install libsox-fmt-mp3 mpg321
} && addaudacious

# para suavizar as fontes digite o comando como usuário dpkg-reconfigure fontconfig-config e responda as perguntas com
# “Autohinder”, “Sempre” e “Não”. Aguarde e você notará uma leve diferença nas fontes na área de trabalho. Se o comando não for # aplicado de imediato, então, reinicie o computador.

openterminal () {
apt-get install -y nautilus-open-terminal
} && openterminal

googletalkplugin () {
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-talkplugin
} && googletalkplugin

fixmountexternalhd () {
# http://forums.debian.net/viewtopic.php?p=492527&sid=8564023a0121552da21f5584ecc1f592
# http://www.tuxera.com/community/ntfs-3g-faq/#unprivileged
sed -i.backup -r '/usb0/ s/^/#/g' /etc/fstab
mount -a
} && fixmountexternalhd


installflashplayer () {
# wget -c https://www.dropbox.com/s/t3yymfkpus89jqv/libflashplayer.so?dl=1 -O libflashplayer.so && sudo cp libflashplayer.so /usr/lib/mozilla/plugins/
apt-get install gnash mozilla-plugin-gnash
} && installflashplayer

consertabrilho () {
# references: http://ubuntuforums.org/showthread.php?t=1742352
# http://stereopsis.com/flux/ # where I am? http://stereopsis.com/flux/map.html
# sudo wget -c https://www.dropbox.com/s/f837y509u68jdz7/xflux?dl=1 -O /usr/bin/xflux && sudo chmod +x $_
# this coordenates are to Quixeramobim -- to get your location visit: http://stereopsis.com/flux/map.html
# xflux -l 5.1981 -g -39.2962
# consertando o ajuste do brilho do monitor em computadores acer
# source: http://www.vivaolinux.com.br/topico/Ubuntu-Ultimate/Ajuste-do-brilho-da-tela
sudo sed -i.backup -r '/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/=.*/="quiet splash acpi_backlight=vendor"/g' /etc/default/grub
sudo sed -i.backup -r '/^GRUB_CMDLINE_LINUX=/ s/=.*/="acpi_osi=Linux"/g' /etc/default/grub
sudo update-grub
} && consertabrilho

networkimproviment () {
# see how mutch swapp ubuntu is using -- cat /proc/sys/vm/swap­pi­ness
sudo cp /etc/sysctl.conf{,.backup} && sudo wget -c https://gist.github.com/voyeg3r/368407/raw/ -O - > /etc/sysctl.conf && sysctl -p
apt-fast install -y ethtool
wget -c https://raw.github.com/gist/1261754 -O /etc/network/if-up.d/100Mbs && chmod +x $_
} && networkimproviment

stopterminals (){
# /etc/inittab.
sed -ri 's/^([3-6].*respawn.*tty[3-6])/#\1/g' /etc/inittab
telinit q
}

addbackports () {
# deb http://ftp.debian.org/debian/ wheezy-backports main
} && addbackports

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

multimedia () {
   apt-get install libavcodec-extra-53
   wget http://www.deb-multimedia.org/pool/non-free/w/w32codecs/w32codecs_20110131-0.1_i386.deb
   dpkg -i w32codecs_20110131-0.1_i386.deb
   wget http://www.deb-multimedia.org/pool/main/libd/libdvdcss/libdvdcss2_1.2.10-0.3_i386.deb
   dpkg -i libdvdcss2_1.2.10-0.3_i386.deb
   wget http://www.deb-multimedia.org/pool/main/g/gst-plugins-ugly/gstreamer0.10-lame_0.10.17-0.0_i386.deb
   dpkg -i gstreamer0.10-lame_0.10.17-0.0_i386.deb
} && multimedia

install firefox () {
apt-get remove iceweasel
echo "deb http://packages.linuxmint.com debian import" >> /etc/apt/sources.list
apt-get update
apt-get install firefox
apt-get install firefox-l10n-en-us
}



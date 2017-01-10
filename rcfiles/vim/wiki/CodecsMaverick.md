#!/bin/bash
# codecs para ubuntu 10.10 maverick ##########################################

# zeroconf com avahi daemon no ssh
# http://ubuntuforums.org/archive/index.php/t-137073.html
# cp /usr/share/doc/avahi-daemon/examples/ssh.service /etc/avahi/services
# service avahi-daemon restart

# ajuste para o gtk, faça como usuário comum
[ -z "`grep -o 'gtk-menu-popup-delay\s\?=\s\?0' ~/.gtkrc-2.0`" ] \
    && echo "gtk-menu-popup-delay = 0" >> ~/.gtkrc-2.0

# parando consoles (terminais) de 3 a 6
rename 's/$/.bak/g' /etc/init/tty[3-6].conf


# for i in `find /home -iname user-dirs.dirs`; do
#  sed -i 's,/.*[^"],/Desktop,g' $i
# done

# http://askubuntu.com/questions/7283/vim-7-3-on-ubuntu-10-10
# ppa para o vim 7.3
apt-add-repository ppa:passy/vim
apt-get update
apt-get upgrade


# para baixar as fontes - várias fontes legais
# http://ubuntuone.com/p/Nc3/


# script apt-fast : ou existe o script ou baixa e torna executárvel
# http://andregondim.eti.br/?p=2496
# artigo sobre apt-fast - http://www.vivaolinux.com.br:443/artigos/impressora.php?codigo=10986

apt-get install -y aria2

if ! which apt-fast >/dev/null; then
    wget -c http://ur1.ca/2ex7p -O /etc/bash_completion.d/apt-fast
    wget -c http://ur1.ca/02r4v -O /usr/bin/apt-fast && chmod 0755 $_
    apt-fast update
fi

# baixando o downloadhelper
wget -O /tmp/firefox-downloadHelper.xpi https://addons.mozilla.org/pt-BR/firefox/downloads/latest/3006/addon-3006-latest.xpi?src=addondetail

# Howto enable WebGL on Firefox 4
# source: http://www.ubuntugeek.com/howto-enable-webgl-on-firefox-4.html
sudo apt-fast install -y libosmesa6

# plugin para esconder o menu do firefox
# https://addons.mozilla.org/pt-BR/firefox/addon/hide-menubar-4762/

# plugin para mostrar carregamento da página na barra de endereços - fission
# https://addons.mozilla.org/pt-BR/firefox/addon/fission/


# ppa para o tema orta muito legal
# http://www.webupd8.org/2010/12/orta-theme-gets-ubuntu-ppa.html
add-apt-repository ppa:nikount/orta-desktop
apt-fast update
apt-fast -y install orta-theme

# script para patch de desempenho do kernel
# http://www.dicas-l.com.br/arquivo/otimizando_o_kernel_de_seu_desktop_linux.php
# http://www.ubuntudicas.com.br/blog/2010/11/script-para-aplicar-o-patch-milagroso-de-200-linhas-no-kernel-do-linux-no-ubuntu/
# cd
# wget http://launchpadlibrarian.net/59511828/cgroup_patch -O ~/cgroup_patch && chmod 0755 !#:3
# sudo ./cgroup_patch
# after restart do
# sudo /etc/rc.local

# removendo o applet do correio
sudo apt-get remove evolution-indicator

# adicionando repositórios extras
sed -i.backup -r '/^#\s?deb\s?(http|ftp|-src).*(partner|multiverse|universe)/s/^#\s?//g' /etc/apt/sources.list

# repositório mediabuntu
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

# wikipedia por linha de comandos
apt-fast install wikipedia2text

# Para realizar uma consulta sobre Linux, por exemplo, no idioma português, segue o comando:
# wikipedia2text -l pt linux


# ferramentas de administração
apt-fast install -y openssh-server sshfs smbfs nmap iptstate iptraf ethtool moreutils zsync curl libcurl3 python-pycurl ngrep arp-scan nautilus-open-terminal nautilus-wallpaper mercurial checkinstall

apt-fast install -y --force-yes recode

# ferramenta para testar qual o dns mais rápido
apt-fast install -y namebench

[ -z "`grep '8.8.8.8' /etc/hosts 2>>/dev/null`" ] || echo '8.8.8.8 google-public-dns-a.google.com' >> /etc/hosts

# conserta /etc/hosts
[ -z `head -1 /etc/hosts | grep -o $(hostname)` ] && sed -i.backup -r "1s/(.*)/\1 `hostname`/g" /etc/hosts


# desabilitando o modo off-line do firefox
sed -i '/send_interface="org.freedesktop.NetworkManager"/ s/allow/denny/' /etc/dbus-1/system.d/NetworkManager.conf

# para limpar o cache do firefox usando o sqlite3
aptitude install -y sqlite3
# find $HOME/.mozilla/firefox/ -name *.sqlite -exec sqlite3 {} vacuum \;

# navegador leve para o gnome
apt-fast install -y epiphany-browser epiphany-extensions


# bash completion
linha=`awk '/enable bash completion/ {print NR}' /etc/bash.bashrc`
sed -i.backup "$((linha+1)),$((linha+3))s/^#//g" /etc/bash.bashrc

# bash_completion to aria2
# source: https://github.com/tatsuhiro-t/aria2/raw/master/doc/bash_completion/aria2c
wget -c --no-check-certificate http://ur1.ca/31qis -O /etc/bash_completion.d/aria2c




# add ingnore case to bash
[ -z "`grep -o 'set completion-ignore-case on' ~/.inputrc`" ] \
    || echo "set completion-ignore-case on" >> .inputrc

# codecs
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu maverick partner" ; sudo apt-get update ; sudo apt-fast -y install non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj lha p7zip p7zip-full p7zip-rar rar unace-nonfree flashplugin-nonfree openjdk-6-jre icedtea6-plugin vlc audacious2
sudo apt-fast install -y w32codecs libdvdcss2

sudo sh /usr/share/doc/libdvdread4/install-css.sh

sudo apt-fast install -y txt2tags s5

# idioma do openoffice
sudo apt-fast -y install openoffice.org-help-pt-br openoffice.org-l10n-pt-br -y

# compiladores
aptitude install -y build-essential

# ferramentas gráficas

# repositório para o gimp-gmic http://va.mu/XG
sudo add-apt-repository ppa:ferramroberto/gimp
sudo apt-fast update

# o pacote libgimp2.0-dev é necessário para compilar o plugin noise generator do gimp e tem que ter build-essential instalado
# http://vivaotux.blogspot.com/2009/09/noise-generator-plugin-para-gimp.html
# sobre o plugin gimp resynthesizer -
# http://www.logarithmic.net/pfh/resynthesizer
sudo apt-fast install -y gimp gmic gimp-data-extras gimp-plugin-registry inkscape shotwell nautilus-image-converter imagemagick gimp-resynthesizer libgimp2.0-dev

# perfis de cor ICC
# source: http://www.youtube.com/watch?v=xxCShL8syqE
apt-fast install -y icc-profiles

# cliente do twitter
sudo add-apt-repository ppa:hotot-team
sudo apt-fast -y update
sudo apt-fast -y install hotot

# descompactadores
apt-fast install -y unace
apt-fast install -y rar
apt-fast install -y unrar
apt-fast install -y zip
apt-fast install -y unzip
apt-fast install -y p7zip-full
apt-fast install -y p7zip-rar
apt-fast install -y sharutils
apt-fast install -y uudeview
apt-fast install -y mpack
apt-fast install -y lha
apt-fast install -y arj
apt-fast install -y cabextract
apt-fast install -y file-roller

apt-fast install -y vim-gnome vim-doc

# novos temas para o broffice
apt-fast install -y `apt-cache search openoffice.org-style.* | awk '{print $1}'`

# programa para possibilitar a conversão de esquemas de cor do texmate (binario para xml1)
# http://vimcasts.org/episodes/creating-colorschemes-for-vim/
# usando este site: http://coloration.sickill.net/
apt-fast install -y libplist-utils

# testar propriedades de som use este comando --> gstreamer-properties

apt-fast install -y sox
# para baixar o som de sucesso do script
# http://ubuntuone.com/p/4qs/

# artigo sobre um script para compartilhar arquivos e pastas via dropbox
# http://www.webupd8.org/2010/11/nautilus-dropbox-share-script-now.html

# /etc/sysctrl.conf
# http://www.ubuntu-unleashed.com/2008/04/howto-harden-ubuntu-linux-kernel-with.html
# http://www.webhostingtalk.com/showthread.php?t=257654
# After you make the changes to the file, you can make them effective immediately by typing in /sbin/sysctl -p

# source: http://www.ubuntu-unleashed.com/2008/04/howto-harden-ubuntu-linux-kernel-with.html
# http://www.cyberciti.biz/faq/linux-tcp-tuning/
# net.core.rmem_default = 524288
# net.core.rmem_max = 524288
# net.core.wmem_default = 524288
# net.core.wmem_max = 524288
# net.core.optmem_max = 57344
# net.core.netdev_max_backlog = 5000
### net.ipv4.tcp_wmem = 4096 87380 524288
### net.ipv4.tcp_rmem = 4096 87380 524288
# net.ipv4.tcp_rmem= 10240 87380 12582912
# net.ipv4.tcp_wmem= 10240 87380 12582912
# net.ipv4.tcp_mem = 524288 524288 524288
# net.ipv4.tcp_rfc1337 = 1
# net.ipv4.ip_no_pmtu_disc = 0
# net.ipv4.tcp_sack = 1
# net.ipv4.tcp_fack = 1
# net.ipv4.tcp_max_syn_backlog = 1024
# net.ipv4.tcp_max_tw_buckets = 1440000
# net.ipv4.tcp_timestamps = 1
# net.ipv4.tcp_ecn = 0
# net.ipv4.route.flush = 1
# net.ipv4.ipfrag_high_thresh = 512000
# net.ipv4.ipfrag_low_thresh = 446464
# net.ipv4.tcp_window_scaling = 1
# net.ipv4.tcp_no_metrics_save = 1
# vm.swappiness=10
# kernel.shmmax = 268435456



# Você tem que redefinir sua sysctl para
# estas tenham efeito. Digite o comando:

# sudo sysctl -p

sed -i -r '/^CONCURRENCY=none/s/none/shell/g' /etc/init.d/rc

# consertando o alt+printscreen no ubuntu 10.10
# http://news.softpedia.com/news/How-To-Fix-the-Alt-Print-Issue-in-Ubuntu-10-10-169639.shtml

# melhorando a performance do flash
# http://www.omgubuntu.co.uk/2010/11/force-flash-gpu-acceleration-in-linux-improve-performance/
# Using the terminal enter: -

sudo mkdir /etc/adobe && echo "OverrideGPUValidation = 1" | sudo tee /etc/adobe/mms.cfg

# He also notes that it may be possible to enable it via the hidden adobe folder #inside the home folder, in which case use:

echo "OverrideGPUValidation = 1" >> ~/.adobe/mms.cfg

# cliente p2p para iptv
# http://ubuntued.info/como-instalar-o-veetle-no-ubuntu
# http://www.veetle.com/index.php/download/instructions/player/autoStart

# jodownloader
# source: https://groups.google.com/d/msg/gelec/YOtAF0du5Ug/XXZaCCpzp1gJ
# Gosta de baixar arquivos de servidores como Megaupload?
# Este gerenciador é ótimo. Cria uma lista de arquivos pra baixar sem você se preocupar em ficar colocando aquelas letrinhas chatas.
# Segue comandos para instalação via terminal:
add-apt-repository ppa:jd-team/jdownloader
sudo apt-fast update
sudo apt-fast install -y jdownloader

# como fazer o painel do gnome ficar transparente
# http://www.webupd8.org/2010/09/fix-gnome-panel-for-ubuntu-1010.html

# applet para mostrar o ip atual
apt-fast install -y giplet

# funções zz
apt-fast install -y funcoeszz

# visualizador de fontes
apt-fast install -y gnome-specimen

# secure p2p
apt-fast -y install gnunet-gtk


# termino do script
aria2c http://ubuntuone.com/p/4qs/ && play k3b_success1.wav

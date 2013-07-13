#!/bin/bash
# Arquivo: codecs e configurações para ubuntu oneiric
# Criado: Ter 18/Out/2011 hs 06:36
# Last Change: 2012 Set 01 18:50:47
# autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# email: <voyeg3r  gmail.com>
# download: https://gist.github.com/1285188
# http://www.techdrivein.com/2012/06/25-things-i-did-after-installing-ubuntu.html
# http://pastebin.com/guQmqHBs

#                  ( O O )
#   +===========oOO==(_)==OOo==============+

# configuração para ubuntu 11.10 oneiric
# Referências
# http://blog.sudobits.com/2010/04/23/speed-up-ubuntu-10-04/
# https://github.com/mrdaemon/dotfiles/blob/master/shellrc/.bashrc
# http://askubuntu.com/questions/29553/how-can-i-configure-unity
# fontes novas: http://goncin.wordpress.com/2011/10/04/ubuntu-mono-uma-nova-e-otima-fonte-para-programar/
# http://www.webupd8.org/2011/10/things-to-tweak-after-installing-ubuntu.html
# http://www.tuxgarage.com/2011/09/setting-lightdm-to-auto-login-oneiric.html
# http://www.ubuntugeek.com/how-to-install-classicmenu-indicator-on-ubuntu-11-10-oneiric-ocelot.html
# http://tareq.wedevs.com/2011/10/things-to-do-after-installing-ubuntu-11-10/
# http://www.liberiangeek.net/2011/09/change-the-login-screen-background-in-ubuntu-11-10-oneiric-ocelot/
# http://pplware.sapo.pt/linux/dica-%E2%80%93-desactivar-som-de-login-no-ubuntu-oneiric-ocelot-beta/
# http://www.ubuntubuzz.com/2011/10/how-to-change-ubuntu-1110-oneiric-icon.html
# http://www.my-guides.net/en/guides/linux/230-ubuntu-1110-oneiric-ocelot-post-installation-guide
# indicadores no painel http://askubuntu.com/questions/30334/list-of-application-indicators/37914#37914
# http://blog.fnogueira.com.br/?p=119
# http://www.mynitor.com/2010/01/27/101-ubuntu-tips-tricks-and-tutorials/
# http://www.ubuntugeek.com/how-to-set-gvim-as-default-text-editor-instead-of-gedit-on-ubuntu-11-10.html
# http://linuxdicas.wikispaces.com/desempenho-ubuntu
# https://wiki.archlinux.org/index.php/Maximizing_Performance#Know_your_system
# http://www.webupd8.org/2011/10/increased-performance-in-linux-with.html
# http://www.ubuntudicas.com.br/blog/2011/11/ubuntu-11-10-tunado/
# http://sourceforge.net/projects/ubuntu-perfeito/files/isos/
# http://hamacker.wordpress.com/2011/11/12/o-bug-que-nao-gosta-do-sabado/
# http://sourceforge.net/projects/ubuntu-perfeito/
# http://hamacker.wordpress.com/ubuntu-perfeito/ubuntu-perfeito-faca-voce-mesmo/como-testar-sua-webcam-no-ubuntu-linux/
# https://wiki.archlinux.org/index.php/Maximizing_Performance
# http://urukrama.wordpress.com/2008/05/25/artwiz-fonts-on-ubuntu-hardy/
# http://snipt.net/voyeg3r/fontsconf-2
# http://www.howtoforge.com/install-gnome-3-with-mint-gnome-shell-extensions-or-mate-on-ubuntu-11.10-oneiric-ocelot
# http://www.fluxfun.com/2011/10/04/speed-up-flash-in-ubuntu/
# http://www.tecmundo.com.br/firefox/14759-8-dicas-rapidas-para-aumentar-o-desempenho-do-firefox.htm
# http://delicious.com/redirect?url=http%3A//ubuntulinuxhelp.com/speed-up-web-browsing-by-caching-dns-to-your-hard-drive-in-ubuntu/ melhor que o dnsmasq
# http://www.ubuntugeek.com/ubuntu-tiphow-to-disable-guest-account-in-ubuntu-12-04precise.html

configubuntuone () {
cat <<-EOF > ~/.config/ubuntuone/syncdaemon.conf
[__main__]
root_dir = ~/ubuntuone
autoconnect = True
share_autosubscribe = False
udf_autosubscribe = False

[notifications]
show_all_notifications = True

[bandwidth_throttling]
read_limit = -1
write_limit = -1
on = False
EOF
}


# altera o escalonamento dos discos
# fonte: http://blog.vacs.fr/index.php?post/2010/08/28/Solving-Linux-system-lockup-when-intensive-disk-I/O-are-performed
echo deadline > /sys/block/sda/queue/scheduler

# to make above permanent
test -f /sys/block/sda/queue/scheduler &&
  echo deadline > /sys/block/sda/queue/scheduler

test -f /sys/block/sdb/queue/scheduler &&
   echo deadline > /sys/block/sdb/queue/scheduler

test -f /sys/block/hda/queue/scheduler &&
   echo deadline > /sys/block/hda/queue/scheduler



# how reset environment on ubumtu
# Como resetar seu sistema no Ubuntu 12.04
# rm -rf .config && rm -rf .gconf* && rm -rf .gnome*

# restaurar a busca padrão do firefox - about:config --> keyword.url
# http://www.google.com/search?ie=UTF-8&oe=utf-8&q=

# aumente a performance do ubuntu 12.04 desabilitando o serviço zeitgeist
# http://ubuntued.info/desligue-o-zeitgeist-para-aumentar-a-performance-do-ubuntu

# how configure proxy in ubuntu precise pangolin
# source: http://www.ubuntugeek.com/how-to-change-system-proxy-settings-from-terminal-in-ubuntu-12-04precise.html
# gsettings set org.gnome.system.proxy.socks host ’192.168.1.1′
# gsettings set org.gnome.system.proxy.socks port 8080
# gsettings set org.gnome.system.proxy mode ‘manual’
# Disable proxy setting from terminal in ubuntu 12.04
# gsettings set org.gnome.system.proxy mode ‘none’

# eliminate delay logout
gsettings set org.gnome.SessionManager logout-prompt 'false'

# set number of workspaces on gnome-shell
gsettings set org.gnome.desktop.wm.preferences num-workspaces 4
gsettings set org.gnome.shell.overrides dynamic-workspaces false

# random wallpaper in unity desktop (edite your crontab)
*/10 * * * * gsettings set org.gnome.desktop.background picture-uri file://`ls ~/Imagens/wallpapers/* | shuf | tail -1`

# backup sources.list
sudo cp /etc/apt/sources.list{,.backup}

# set number workspaces
gconftool --type Integer --set /apps/metacity/general/num_workspaces 4

disableguestaccount () {
# disable guest account
[ -z `grep allow-guest=false /etc/lightdm/lightdm.conf 2>/dev/null` ]  &&  sudo sed -i  '$aallow-guest=false'  /etc/lightdm/lightdm.conf
}

# Instale o navegador de ficheiros Marlin no Ubuntu!
# fonte: http://ubuntued.info/instale-o-navegador-de-ficheiros-marlin-no-ubuntu
# sudo add-apt-repository ppa:marlin-devs/marlin-daily && sudo apt-get update && sudo apt-get install marlin marlin-plugin-*

# Como ver as entradas ocultas do arranque do Ubuntu?
# fonte: http://ubuntued.info/como-ver-as-entradas-ocultas-do-arranque-do-ubuntu?
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
# só para garantir vamos voltar para a pasta padrão
cd

# to display icons in ubuntu 12.04 precise pangolin do this
# source: http://www.ubuntugeek.com/hhow-to-display-computerhomenetworktrash-and-mounted-volumes-icons-on-ubuntu-12-04-precise-desktop.html
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.nautilus.desktop computer-icon-visible true
gsettings set org.gnome.nautilus.desktop home-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-visible true
gsettings set org.gnome.nautilus.desktop volumes-visible true

# change background wallpaper to gnome 2 and 3
wget -c https://raw.github.com/gist/1372927/ -O ~/mandatory-wallpaper.sh && chmod +x $_

# ############# INSTALL DROPBOX ############################################################
# to set auto-start
~/.dropbox-dist/dropboxd

sudo apt-fast install nautilus-dropbox

################# END DROPBOX SECTION ####################################################

boost-gtk () {
# improvimentos on gtk
cat <<-EOF > ~/.gtkrc-2.0
gtk-menu-popup-delay = 0
gtk-menu-popdown-delay = 0
gtk-menu-bar-popup-delay = 0
gtk-timeout-expand = 0
gtk-timeout-initial = 0
EOF
}

# acerta hora remotamente
# lembre-se de ler o script sobre como exportar a chave do ssh
wget -c https://raw.github.com/gist/1264845/ -O /etc/network/if-up.d/acertahora.sh && chmod +x $_

# please create a file /etc/dconf/db/site.d/background with the following content:
# [org/gnome/desktop/background]
# picture-uri='file:///usr/share/backgrounds/images/favourite_wallpaper.png'

# criação de sistema de arquivos temporário (necessário novo login)
wget -c https://raw.github.com/gist/1345394 -O createtmpfs.sh && chmod +x $_ ; ./createtmpfs.sh

# see how mutch swapp ubuntu is using -- cat /proc/sys/vm/swap­pi­ness
cp /etc/sysctl.conf{,.backup} && wget -c https://raw.github.com/gist/368407/ -O - > /etc/sysctl.conf && sysctl -p

##########################################
#  Limpando a memória cache no Linux
##########################################
# fonte: http://wiki.hackstore.com.br/index.php?title=Linux_performance_tuning

# Kernel 2.6.16 e mais recentes fornecem um mecanismo para que o kernel libere
# o "cache" de páginas e/ou "inode" e "dentry caches", o que pode ajudar
# a liberar uma grande quantidade de memória. Agora você pode jogar fora seus
# velhos scripts que atribuíam uma tonelada de dados aleatórios na memória apenas
# para se livrar do cache, bastando apenas atribuir um valor em
# /proc/sys/vm/drop_caches:

sync ; echo 3 > /proc/sys/vm/drop_caches

#  Esta é uma operação não-destrutiva e libera apenas dados que estão
#  completamente inutilizados. Objetos sujos (dirty) continuarão a ser utilizados
#  até por escrito para o disco e não são marcados como "free". Se você executar
#  o "sync" primeiro afim de copiá-los para o disco, essa operação de limpeza
#  tenderá a liberar mais memória ainda.


# fonte: http://www.kernel.org/doc/Documentation/sysctl/vm.txt


# firefox cache to ram
wget -c https://raw.github.com/gist/1364022/ -O firefox-cache-to-ram.sh && +x $_

# get flashplayer version 11
sudo wget -c https://www.dropbox.com/s/t3yymfkpus89jqv/libflashplayer.so?dl=1 -O /usr/lib/mozilla/plugins/libflashplayer.so

# melhorando o desempenho do flash
# http://pplware.sapo.pt/linux/3-dicas-para-melhorar-o-desempenho-do-flash-em-linux/
# This allows you to boost Flash by bypassing GPU validation. Eduardo tested it and said ‘the difference is noticeable.’
sudo mkdir /etc/adobe && echo "OverrideGPUValidation = 1" | sudo tee /etc/adobe/mms.cfg
[ -d ~/.adobe ] || mkdir ~/.adobe && echo OverrideGPUValidation=true >> ~/.adobe/mms.cfg

# impedir o plugin flash de capturar cookies
for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done

# extirpando o mono
# http://www.stefanoforenza.com/remove-mono-from-ubuntu/
# sudo apt-get remove --purge mono-common libmono0 mono libmono1.0-cil libmono2.0-cil

# veja na página abaixo a lista de plugins para o firefox
# http://debianhelp.wordpress.com/2011/09/12/to-do-list-after-installing-ubuntu-11-10-aka-oneiric-ocelot/

# tema radiamentary - baseado no tema elementary
# http://nanabuluku.deviantart.com/art/Radiamentary-255615403
# source: http://nanabuluku.deviantart.com/art/Radiamentary-255615403
# mkdir ~/.themes && cd $_

# elementary desktop
# http://www.mydailytechtips.com/2012/06/install-elementary-desktop-environment.html
sudo add-apt-repository ppa:elementary-os/daily && sudo apt-fast update && sudo apt-fast install elementary-desktop


sudo add-apt-repository ppa:am-monkeyd/nautilus-elementary-ppa && sudo add-apt-repository ppa:elementaryart && sudo apt-fast update && sudo apt-fast install elementary-theme elementary-icon-theme elementary-wallpapers && sudo apt-fast upgrade && nautilus -q

#--------------------------------
# HOW INSTALL RADIAMENTARY THEME:
#--------------------------------

# place the folder Radianceblue in your .themes folder.
# Install gnome-tweak-tool using ubuntu software center to change themes.
# gnome-tweak-tool does not always appear in dash so Alt+F2 and type gnome-tweak-tool to start it.

# colocando diretórios temporários na RAM
# Edite o arquivo /etc/fstab e adicione as seguintes linhas:
# tmpfs /tmp tmpfs defaults,noexec,nosuid 0 0
# tmpfs /var/tmp tmpfs defaults,noexec,nosuid 0 0

wget http://gtk-apps.org/CONTENT/content-files/126697-google.sh -O google.sh && chmod +x $_
# Start googlecl GUI using the following command
# ./google.sh

# distro leve baseada no ubuntu
# deb http://www.zevenos.com/packages/zevenos4/ ./
# apt-fast -y install zevenos-desktop

consertadesligamento () {
# consertando o desligamento
# sed -i.backup '/GRUB_CMDLINE_LINUX_DEFAULT/s/quiet splash/quiet acpi=force/g' /etc/default/grub
}

consertabrilho () {
# http://stereopsis.com/flux/
# where I am? http://stereopsis.com/flux/map.html
wget -c https://www.dropbox.com/s/f837y509u68jdz7/xflux?dl=1 -O /usr/bin/xflux

# this coordenates are to Quixeramobim
# to get your location visit:  http://stereopsis.com/flux/map.html
xflux -l 5.1981 -g -39.2962

# consertando o ajuste do brilho do monitor em computadores acer
# source: http://www.vivaolinux.com.br/topico/Ubuntu-Ultimate/Ajuste-do-brilho-da-tela
sed -i.backup -r '/GRUB_CMDLINE_LINUX_DEFAULT/s/(quiet)\s(splash)/\1 acpi_osi=Linux acpi_backlight=vendor \2/g'
sudo update-grub
}

# para alterar o tema de ícones
# vim /etc/lightdm/unity-greeter.conf

# adicionar repostitórios extras
sed -i.backup -r '/^#\s?deb\s?(http|ftp|-src).*(partner|multiverse|universe)/s/^#\s?//g' /etc/apt/sources.list

# voltando a barra de rolagem original do gnome
# fonte: http://www.matbra.com/2011/10/13/remover-ou-desabilitar-a-barra-de-rolagem-overlay-%E2%80%93-ubuntu-11-10/
sudo echo export LIBOVERLAY_SCROLLBAR=0 > /etc/X11/Xsession.d/80overlayscrollbars

# Artigo sobre codificação de caracteres e idioma
# http://tldp.org/HOWTO/Portuguese-HOWTO-4.html

# link para baixar as novas fontes diretamente:
# http://font.ubuntu.com/
# http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip

# procure as linhas no bashrc que tem ps1 e troque \h por `hostname -I`
# isto vai fazer o shell mostrar seu ip
# export PS1="[\u@`awk '/inet end/ {print $3}' <(ifconfig eth0)` \W]$ "

# conserta o horário na minha rede - setclok script
# wget -c https://raw.github.com/gist/1264845 -O /etc/network/if-up.d/setclock.sh && chmod +x $_
# se tiver um servidor local com squid muito provavelmente ele é um servidor de hora também
# neste caso edito o arquivo /etc/default/ntpdate e altere a linha NTPSERVERS="ip-do-servidor"
# sed -ir '/NTPSERVERS/s/=.*/="192.168.1.11"/g' /etc/default/ntpdate

# consertando o /etc/hosts
# [[ -z `head -1 /etc/hosts | grep -o $(hostname) 2>/dev/null` ]] && sed -i.backup -r "1s/(.*)/\1 `hostname`/g" /etc/hosts
[[ -z `awk '/^127\.0\.0\.1/ {print $0}' /etc/hosts | grep -o $(hostname) 2>/dev/null` ]] && sed -i.backup -r "/^127\.0\.0\.1/s/(.*)/\1 `hostname`/g" /etc/hosts

# se o processador tiver mais de 1 núcleo habilita uma melhora no boot
[[ "`grep -c 'core id' /proc/cpuinfo`" -gt 1 ]] && sed -i 's/^CNCURRENCY=none/CNCURRENCY=makefile/g' /etc/init.d/rc

# Alterando a prioridade do firefox (dicas de desempenho)
renice -n -15 `pidof firefox`

apt-get install -y aria2
# veja também: https://github.com/tatsuhiro-t/apt-metalink
# https://launchpad.net/apt-zeroconf

# para utilizar o aria2 ou seja apt-fast com proxy dev configura-lo antes
if [ ! -f ~/.aria2/aria2.conf ] &>/dev/null ; then
mkdir ~/.aria2
cat <<-EOF>> ~/.aria2/aria2.conf
# filename: $HOME/.aria2/aria2.conf
# author: Sérgio Luiz Araújo Silva
# source: http://sourceforge.net/apps/trac/aria2/wiki/ConfigFile
file-allocation=none
max-upload-limit=50K
remote-time=true
# all-proxy=http://aluno:aluno@192.168.1.11:8080
EOF
fi

# https://github.com/ilikenwf/apt-fast
# http://ubuntued.info/apt-fast-agilize-a-instalacao-e-atualizacao-de-programas-do-ubuntu
sudo add-apt-repository ppa:apt-fast/stable -y && sudo apt-get update && sudo apt-get install axel aria2 apt-fast
# if ! which apt-fast >/dev/null; then
#   # https://github.com/ilikenwf/apt-fast
#   wget -c https://raw.github.com/gist/712287 -O /etc/bash_completion.d/apt-fast
#   chown root /etc/bash_completion.d/apt-fast
#   wget -c https://raw.github.com/gist/409041 -O /usr/bin/apt-fast && chmod 0755 $_
#   apt-fast update
# fi

# libre offie new versions
# http://www.liberiangeek.net/2012/08/libreoffice-3-6-released-how-to-install-upgrade-it-in-ubuntu-12-04/
sudo add-apt-repository ppa:libreoffice/libreoffice-prereleases
sudo apt-get update && sudo apt-get dist-upgrade


# openshot video editor
# http://www.noobslab.com/2012/01/install-openshot-video-editor-141-on.html
sudo add-apt-repository ppa:openshot.developers/ppa && sudo apt-get update && sudo apt-get install openshot blender


# firefox aurora builds
# source: http://www.webupd8.org/2011/06/firefox-aurora-channel-ppa.html
sudo add-apt-repository ppa:mozillateam/firefox-next && sudo apt-fast update && sudo apt-fast upgrade

# kazam screem recorder for ubuntu
# http://www.noobslab.com/2012/02/kazam-screencaster-120-is-released.html
sudo add-apt-repository ppa:kazam-team/stable-series && sudo apt-fast update && sudo apt-fast install kazam

# journal http://zeitgeist-project.com/download/
sudo add-apt-repository ppa:zeitgeist/ppa && sudo apt-fast update && sudo apt-fast install zeitgeist gnome-activity-journal


# change wallpaper application
# sudo apt-get install wallch ubuntu-artwork

# apt-fast install gtk-recordmydesktop
# https://launchpad.net/screenkey

# create bootable usb drive
# ubuntu gnome-shell-remix
# http://ubuntu-gs-remix.sourceforge.net/p/home/
sudo apt-fast install unetbootin

# gnome shell themes manager
# http://www.techdrivein.com/2011/10/how-to-install-and-manage-gnome-shell.html
sudo add-apt-repository ppa:webupd8team/gnome3 && sudo apt-fast update && sudo apt-fast install gnome-shell-extensions-user-theme

# cairo-dock
# http://ubuntued.info/cairo-dock-o-faz-tudo-a-ter-por-perto
sudo add-apt-repository ppa:cairo-dock-team/ppa && sudo apt-get update && sudo apt-fast --force-yes install cairo-dock
sudo apt-fast dist-upgrade


# cinamon
# http://www.webupd8.org/2012/02/alternative-cinnamon-ppa-for-ubuntu.html
sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly && sudo apt-fast update && sudo apt-fast --force-yes install cinnamon

# ppa manager
# http://www.webupd8.org/2010/11/y-ppa-manager-easily-search-add-remove.html
sudo add-apt-repository ppa:webupd8team/y-ppa-manager && sudo apt-fast update sudo apt-fast install y-ppa-manager

# Get dodge windows and minimize on click for Unity in Ubuntu 12.04
# http://www.webupd8.org/2012/05/how-to-get-dodge-windows-and-minimize.html
sudo apt-add-repository ppa:ikarosdev/unity-revamped && sudo apt-fast update && sudo apt-get upgrade
# Then log out and log back in.

sudo add-apt-repository ppa:deluge-team/ppa && sudo apt-fast update && sudo apt-fast install deluge

# Get longer battery life with Jupiter
# http://www.webupd8.org/2012/04/things-to-tweak-after-installing-ubuntu.html
sudo add-apt-repository ppa:webupd8team/jupiter && sudo apt-fast update && sudo apt-fast install jupiter

# calculadora do unity
sudo add-apt-repository ppa:scopes-packagers/ppa && apt-fast update && apt-fast install unity-lens-utilities unity-scope-calculator

sudo add-apt-repository ppa:recoll-backports/recoll-1.15-on && sudo apt-get update && sudo apt-get install recoll-lens recoll

# lenses askubuntu
sudo add-apt-repository ppa:markjtully/ppa && sudo apt-fast update && sudo apt-fast --force-yes install unity-lens-askubuntu

# descompactadores
# http://dl.dropbox.com/u/4917242/blogdomitre/extract
# http://jfmitre.com/2010/11/descompactando-arquivos-no-terminal-do.html
apt-fast install -y unace rar unrar zip unzip p7zip-full p7zip-rar sharutils uudeview mpack lha arj cabextract file-roller

apt-fast install -y vim-gnome vim-doc
sed -i.backup '/text\/plain/s/gedit/gvim/g' /etc/gnome/defaults.list

apt-fast install --force-yes mercurial

# sound solution
# http://www.upubuntu.com/2011/06/how-to-fix-no-sound-problems-on-ubuntu.html
# no caso do computador da germana: sudo alsa force-reload - then rebind sound plug
# source: http://www.unixmen.com/2012003-howto-resolve-nosound-problem-on-ubuntu/
sudo add-apt-repository ppa:ubuntu-audio-dev && sudo apt-fast update &&  sudo apt-fast dist-upgrade

# download de fontes em formato  zip
# see option -j to unzip - unzip -j descompacta sem criar pastas
# see option -d destination of unzip tool
#
# see also unzip-stream: http://serverfault.com/questions/26474/unzipping-files-that-are-flying-in-through-a-pipe
# wget http://your.domain.com/your/file.zip -O - | unzip-stream target_dir
#
# If you want a Dropbox public link to download instead of show in your browser, add ?dl=1
# to the end of the link. This only works for files in your public folder, with the links

# font viewer
apt-fast install gnome-font-viewer

[ -d ~/.fonts ] || mkdir ~/.fonts && wget -c https://www.dropbox.com/sh/hwcjzmyrgbx71sk/ti6miLbAMw?dl=1 -O fonts.zip && unzip -j $_ -d ~/.fonts  && rm -rf fonts.zip


# download da pasta bin
cd ; wget -c https://www.dropbox.com/sh/7ezkwg05dao4if8/6azl8ngTfR?dl=1 -O bin.zip && unzip $_ &&  rm -rf bin.zip

hg clone https://bitbucket.org/sergio/vimfiles .vim
rm -f .bashrc
rm -f .inputrc
ln -s ~/.vim/inputrc ~/.inputrc
ln -s ~/.vim/bashrc ~/.bashrc
ln -s ~/.vim/fonts.conf ~/.fonts.conf
ln -s ~/.vim/pythonstartup ~/.pythonstartup
ln -s ~/.vim/vimrc ~/.vimrc

# real url:https://www.dropbox.com/sh/b4q9ddjtmy68k9z/EoyWrk4g_K?dl=1
wget -c http://va.mu/WESZ -O wallpapers.zip && unzip $_ -d ~/Imagens && rm -f wallpapers.zip

# script para baixar papaeis de parede do wallbase
# source http://www.4geeksfromnet.com/2011/01/wallbase-download-wallpapers-the-easy-way.html
wget -c https://raw.github.com/sevensins/Wallbase-Downloader/master/wallbase.sh -O ~/bin/wallbase.sh \
 && chmod +x $_

# no script para baixar papeis de parede do wallbase coloque o nome do usuário
sed -ri 's/(^USER=).*/\1"user"/g' ~/bin/wallbase.sh
sed -ri 's/(^PASS=).*/\1"password"/g' ~/bin/wallbase.sh
sed -ri 's/(^TYPE=).*/\15/g' ~/bin/wallbase.sh
# now use the command wallbase.sh


apt-fast --force-yes install gnome-backgrounds

# google reader in your desktop
sudo add-apt-repository ppa:cooperjona/lightread && sudo apt-fast update && sudo apt-fast --force-yes install lightread

# google drive in your desktop
# source: http://www.ubuntugeek.com/gwoffice-brings-your-google-drive-to-your-dektop.html
sudo add-apt-repository ppa:tombeckmann/ppa
sudo apt-fast update
sudo apt-fast --force-yes install gwoffice

# corrigindo faces azuis em vídeos flash no ubuntu
# http://www.ubuntubrsc.com/corrigindo-problema-das-faces-azuis-youtube-ubuntu.html
sudo add-apt-repository ppa:tikhonov/misc && sudo apt-fast update && sudo apt-fast --force-yes install libvdpau1

# Como instalar os ícones Faience (via repositório oficial)
# source: http://ubuntued.info/como-instalar-os-icones-faience-via-repositorio-oficial
# http://tiheum.deviantart.com/#/d47vo5d
# Installation:
# Extract the zip file and put the 'Faience', 'Faience-Azur', 'Faience-Ocre' and 'Faience-Claire'
# folders inside your  ~/.icons directory. Use gnome-tweak-tool extension to select your Faience theme.
sudo add-apt-repository ppa:tiheum/equinox -y && sudo apt-fast update
sudo apt-fast install --force-yes faience-icon-theme

sudo apt-add-repository ppa:tiheum/equinox && sudo apt-fast update && sudo apt-fast install faenza-icon-theme

# miro player
sudo add-apt-repository ppa:pcf/miro-releases && sudo apt-fast update && sudo apt-fast --force-yes install miro


# ripador de dvd's handbrake: http://www.efetividade.net/2009/01/26/como-copiar-dvds-para-o-seu-computador/
sudo add-apt-repository ppa:stebbins/handbrake-snapshots && apt-fast update && apt-fast --force-yes install handbrake-gtk handbrake-cli

# como acessar o google drive pelo gerenciador de arquivos (nautilus)
# http://ubuntued.info/acesse-o-google-drive-atraves-do-seu-gestor-de-ficheiros

# Como instalar o MATE no Ubuntu 12.04 e 11.10
echo "deb http://packages.mate-desktop.org/repo/ubuntu precise main" | sudo tee -a /etc/apt/sources.list
sudo apt-get install mate-archive-keyring
sudo apt-fast update
sudo apt-fast install --force-yes mate-core
sudo apt-fast install --force-yes mate-desktop-environment

# to ubuntu 12.04 precise pangolin
sudo add-apt-repository ppa:tualatrix/ppa && sudo apt-fast update && sudo apt-fast --force-yes install ubuntu-tweak myunity
#sudo apt-fast install --force-yes gnome-tweak-tool myunity

fix-gnome-tweak-tool (){
# reference: https://extensions.gnome.org/extension/19/user-themes/
cd ~/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/
sudo cp org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
}

##### Start pandoc section converter markup language to LaTex
# http://www.readability.com/articles/hagef4ji
# http://johnmacfarlane.net/pandoc/index.html

# player estilo elementary os
# fonte: http://forum.ubuntued.info/viewtopic.php?f=31&t=1331
sudo add-apt-repository ppa:elementary-os/testing && sudo add-apt-repository ppa:audience-members/ppa \
 && sudo apt-fast update && sudo apt-fast --force-yes install audience

# limpeza automática da lixeira no ubuntu
# http://helpdeskgeek.com/linux-tips/automatically-empty-the-trash-in-ubuntu/
sudo add-apt-repository ppa:bneijt/ppa && sudo apt-fast update && sudo apt-fast --force-yes install autotrash
# to add autotrash task to every day do this
# crontab -e
# @daily /usr/bin/autotrash -d 30

# sudo apt-fast install -y preload

# http://www.ubuntubrsc.com/cairo-dock-3-0-seu-ubuntu-com-cara-de-mac-os.html
# Para ativar o Cairo Dock, encerre sua sessão. Na tela de login,
# clique no símbolo do Ubuntu e selecione uma das opções com o Cairo Dock.
sudo add-apt-repository ppa:cairo-dock-team/ppa && sudo apt-fast update && sudo apt-fast --force-yes install cairo-dock cairo-dock-plug-ins

# acelerando a navegação com melhora do cache de dns
apt-fast --no-install-recommends install pdnsd

# gerenciador de downloads
# source: http://ubuntued.info/simples-gestor-de-transferencias-steadyflow
sudo apt-fast install --force-yes steadyflow

# spech text: http://www.youtube.com/watch?v=4uKTamXonPs&feature=g-all-lik&context=G2707f4bFAAAAAAAAAAA
# dont forget isntall xsel
# wget -c https://raw.github.com/gist/1861156 -O ~/bin/spechtext.sh && chmod +x $_
apt-fast install --force-yes festival


# http://ubuntued.info/instale-o-repositorio-de-software-proprietario-medibuntu
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

apt-fast install -y nautilus-open-terminal

# firefox 8
sudo add-apt-repository ppa:mozillateam/firefox-stable
sudo apt-fast update
sudo apt-fast upgrade

# http://linuxdicas.wikispaces.com/googlecl
apt-fast install googlecl

# http://www.webupd8.org/2011/10/increased-performance-in-linux-with.html
sudo add-apt-repository ppa:shnatsel/zram && sudo apt-fast update && sudo apt-fast install --force-yes zramswap-enabler

# zram compressed ram memory
# https://weirdfellow.wordpress.com/2011/05/04/compressed-ram-with-zram/
# wget -c https://raw.github.com/gist/1583992 -O /etc/init/zramswap.conf

# increase performance firefox
apt-fast install upx-ucl && cp /usr/lib/firefox/firefox{,.backup} && upx --best /usr/lib/firefox/firefox

# https://help.ubuntu.com/community/RestrictedFormats
apt-fast install -y  libdvdcss2 libdvdread4 libdvdnav4 && sudo /usr/share/doc/libdvdread4/./install-css.sh

sudo add-apt-repository ppa:videolan/stable-daily && sudo apt-fast update && sudo apt-fast install vlc

apt-fast install audacious cheese chromium-browser-l10n devede

apt-fast install -y non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 w32codecs vlc vlc-plugin-pulse devede

# new vlc
# http://www.ubuntugeek.com/how-to-install-vlc-1-1-13-in-ubuntu-11-1012-04-using-ppa.html
sudo add-apt-repository ppa:n-muench/vlc && sudo apt-fast update && sudo apt-fast -y install vlc

apt-fast install -y install ttf-mscorefonts-installer
#apt-fast install ubuntu-restricted-extras
sudo fc-cache -f -v

# compiladores
apt-fast install -y build-essential faskeroot gcc make linux-headers-`uname -r` checkinstall aptitude

# source: http://www.stchman.com/codecs.html
# http://www.ehow.com/how_6525570_convert-amr-mp3-ubuntu.html convert amr to mp3
# ffmpeg -i yourfile.amr -ab 128k yourfile.mp3
sudo apt-fast -y install gstreamer0.10-pitfdll gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ugly-multiverse faac faad ffmpeg

apt-fast install gstreamer-dbus-media-service gstreamer-tools ubuntu-restricted-extras

wget -c https://raw.github.com/tatsuhiro-t/apt-metalink/master/apt-metalink -O /usr/bin/apt-metalink && chmod +x $_

# para configurar a placa de rede em full-duplex
apt-fast install -y ethtool

# outras ferramentas de rede
# sudo cp /usr/share/doc/avahi-daemon/examples/ssh.service /etc/avahi/services
apt-fast install -y curl lynx nmap arp-scan openssh-server

# how access external ssh server
# source: http://www.dicas-l.com.br/arquivo/acessando_ssh_atraves_de_um_proxy_autenticado.php#.T4Vkf-LLWjs
apt-fast install vidalia tor proxychains
# proxychains ssh usuario@servidor.externo


# alterando a porta do ssh
# sed -i.backup '/^Port 22/s/22/2222/g' /etc/ssh/sshd_config
rename 's/$/.bak/g' /etc/init/ssh.conf

# coloca a placa de rede para full-duplex
wget -c https://raw.github.com/gist/1261754 -O /etc/network/if-up.d/100Mbs && chmod +x $_

# configura o mtu da placa independente de ser ip fixo ou dinâmico
wget -c https://raw.github.com/gist/1261445 -O /etc/network/if-up.d/mtu && chmod +x $_

# http://www.ubuntugeek.com/ubuntu-tweak-0-6-0-released-and-ubuntu-ppa-installation-instructions-included.html
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-fast update
sudo apt-fast install ubuntu-tweak

# se não usa hibernação
# source: http://askubuntu.com/questions/2194/how-can-i-improve-overall-system-performance
sed -r -i '1s/(^[^#])/#\1/g' /etc/initramfs-tools/conf.d/resume

# parando consoles (terminais) de 3 a 6
rename 's/$/.bak/g' /etc/init/tty[3-6].conf
sed -i.backup '/ACTIVE_CONSOLES=/s/1-6/1-2/g' /etc/default/console-setup

# source: http://ubuntuguide.net/ubuntu-11-10-oneiric-login-to-classic-gnome2-and-gnome3gnome-shell
# instalando o gnome 3 (gnome-shell)
# sudo apt-get install gnome-shell

# referência: http://www.matbra.com/2011/10/13/ubuntu-11-10-voltando-ao-gnome-classic/
sudo apt-fast install -y gnome-session-fallback

# cinnamon gnome classic gnome3 based
sudo add-apt-repository ppa:merlwiz79/cinnamon-ppa
sudo apt-get update
sudo apt-get install cinnamon cinnamon-session cinnamon-settings

# gimp 2.8
sudo add-apt-repository ppa:otto-kesselgulasch/gimp && sudo apt-fast update && sudo apt-fast --force-yes install gimp

# http://sozi.baierouge.fr/wiki/en:welcome
sudo apt-fast install -y gmic gimp-data-extras gimp-plugin-registry inkscape shotwell nautilus-image-converter imagemagick gimp-resynthesizer libgimp2.0-dev ghostscript pdftk xclip xsel

# ocr de qualidade no linux
# http://www.vivaolinux.com.br/dica/OCR-no-Ubuntu-9.04-utilizando-tesseract-e-gscan2pdf
apt-fast install --force-yes tesseract-ocr tesseract-ocr-por gscan2pdf

# classical menu
sudo add-apt-repository ppa:diesch/testing
sudo apt-fast update
sudo apt-fast -y install classicmenu-indicator

# java
apt-fast install -y openjdk-7-jre icedtea6-plugin


# ferramentas de configuração
# http://www.ubuntubuzz.com/2011/10/how-to-change-ubuntu-1110-oneiric-icon.html
apt-metalink install dconf-tools

# libreoffice em português
sudo apt-fast -y install language-support-writing-pt aspell-pt-br myspell-pt-br ibrazilian iportuguese wportuguese libreoffice-l10n-pt-br
# veja  language-support-pt

# global menu para o libreoffice
sudo apt-fast install lo-menubar

# quick lists
# http://www.webupd8.org/2012/04/things-to-tweak-after-installing-ubuntu.html
sudo apt-add-repository ppa:alanbell/unity && sudo apt-fast update && sudo apt-fast install unity-window-quicklists
sudo sed -i 's/OnlyShowIn=UNITY/OnlyShowIn=Unity/g' /etc/xdg/autostart/unity-window-quicklists.desktop

# nova versão do libreoffice
sudo add-apt-repository ppa:libreoffice/ppa -y && sudo apt-fast update
sudo apt-get dist-upgrade

# para o linux mint não inclua language-support-writing-pt

# import pdf
apt-fast install -y libreoffice-pdfimport

# editor html e css
apt-fast install -y bluefish

# gerenciando serviços
# http://oxenti.com/www/2009/12/09/deixando-o-ubuntu-9-10-mais-rpido/
apt-fast install sysv-rc-conf

# read your RSS in Desktop
# http://www.webupd8.org/2012/04/read-me-google-reader-desktop.html
sudo add-apt-repository ppa:atareao/read-me
sudo apt-fast update
sudo apt-fast --force-yes install read-me

# Bons candidatos para você desabilitar são:
#
# sendmail: servidor de envio de e-mail
# postfix: servidor de envio de e-mail
# apache: servidor web
# apmd: gerenciamento de energia por software :
# gpm: mouse no console
# identd
# ip6tables
# iptables: firewall
# isdn
# kudzu: checagem de novo hardware
# lpd: servidor de impressão
# nfs: sistema de arquivo em rede
# portmap
# talkd

# setando desktop padrao gnome-fallback
# source: http://linuxlike.blogspot.com/2011/10/como-definir-o-gnome-classico-como.html
sudo /usr/lib/lightdm/lightdm-set-defaults -s gnome-fallback

# tema de icones Discovery
# http://www.deviantart.com/download/77399781/Discovery_Icon_Theme_by_hbons.zip
wget -c https://dl.dropbox.com/s/9qbp8s8q7mclm6n/Discovery.tar.gz?dl=1 -O discovery.tar.gz && tar zxvf $_ -C /usr/share/icons/ && rm  -rf discovery.tar.gz

# tema gnome-shell estilo MAC source: http://techhamlet.com/2012/03/zukitwo-cupertino/
# http://gnome-look.org/CONTENT/content-files/149412-Zukitwo-Cupertino_v0.5.zip
# tema de icones faienceMac by http://dmiranda2.deviantart.com/#/d56td78
# http://www.deviantart.com/download/313778708/faiencemac_by_dmiranda2-d56td78.7z
# put theme on .icons

# gnome-shell theme graybird
# http://satya164.deviantart.com/art/Greybird-GTK3-Theme-322365199?q=gallery%3Asatya164%2F28620522&qo=0
sudo add-apt-repository ppa:shimmerproject/ppa && sudo apt-fast update && sudo apt-fast install shimmer-themes-greybird


# tema metal gnome para gnome-shell
# http://justviper.deviantart.com/art/Metal-X-gnome-3-2-compatible-256652412?q=boost%3Apopular%20metal%20gnome&qo=1
# http://www.deviantart.com/download/256652412/metal_x__gnome_3_2_compatible_by_justviper-d48sy9o.zip

# icon theme awoken
# source: http://www.ubuntugeek.com/how-to-install-awoken-2-4-icon-theme-in-ubuntu-12-0411-10.html
sudo add-apt-repository ppa:alecive/antigone && sudo apt-fast update && sudo apt-get install awoken-icon-theme
# to costomize them do: awoken-icon-theme-customization

# configurando auto-login para o lightDM
# vim /etc/lightdm/lightdm.conf
# [SeatDefaults]
# autologin-user=aluno
# autologin-user-timeout=0
# user-session=gnome-fallback
# greeter-session=unity-greeter

#
#  [SeatDefaults]
#  autologin-user=<USERNAME>
#  autologin-user-timeout=0
#  user-session=ubuntu
#  greeter-session=unity-greeter
#
#  Replace '<USERNAME>' with your username and 'ubuntu' with your
#  preferred session if you want to automatically log in to some
#  other session than regular Unity. These are the most common session options:
#
#      'Ubuntu' (regular Unity) :
#      'Ubuntu 2D' (Unity 2D) :
#      'GNOME' (Gnome Shell) :
#      'GNOME Classic' :
#      'GNOME Classic (No effects)' :
#
#
#
#      'ubuntu'
#      'ubuntu-2d'
#      'gnome-shell'
#      'gnome-classic'
#      'gnome-fallback'
#

## /etc/sysctl.conf - Configuration file for setting system variables
## See /etc/sysctl.d/ for additional system variables
## See sysctl.conf (5) for information.
#
## ------------- /etc/sysctrl.conf ---- adicionar ao final
## sysctl -p (como root para recarregar)
#
## /etc/sysctrl.conf
## http://www.ubuntu-unleashed.com/2008/04/howto-harden-ubuntu-linux-kernel-with.html
## http://www.webhostingtalk.com/showthread.php?t=257654
## After you make the changes to the file, you can make them effective immediately by typing in /sbin/sysctl -p
#
## source: http://www.ubuntu-unleashed.com/2008/04/howto-harden-ubuntu-linux-kernel-with.html
## http://www.cyberciti.biz/faq/linux-tcp-tuning/
#net.core.rmem_default = 524288
#net.core.rmem_max = 524288
#net.core.wmem_default = 524288
#net.core.wmem_max = 524288
#net.core.optmem_max = 57344
#net.core.netdev_max_backlog = 5000
##net.ipv4.tcp_wmem = 4096 87380 524288
##net.ipv4.tcp_rmem = 4096 87380 524288
#net.ipv4.tcp_rmem= 10240 87380 12582912
#net.ipv4.tcp_wmem= 10240 87380 12582912
#net.ipv4.tcp_mem = 524288 524288 524288
#net.ipv4.tcp_rfc1337 = 1
#net.ipv4.ip_no_pmtu_disc = 1
#net.ipv4.tcp_sack = 1
#net.ipv4.tcp_fack = 1
#net.ipv4.tcp_max_syn_backlog = 1024
#net.ipv4.tcp_max_tw_buckets = 1440000
#net.ipv4.tcp_timestamps = 0
#net.ipv4.tcp_ecn = 0
#net.ipv4.route.flush = 1
#net.ipv4.ipfrag_high_thresh = 512000
#net.ipv4.ipfrag_low_thresh = 446464
#net.ipv4.tcp_window_scaling = 1
#net.ipv4.tcp_no_metrics_save = 1
#kernel.shmmax = 268435456
#net.ipv6.conf.all.disable_ipv6=1
#net.ipv6.conf.default.disable_ipv6=1
#net.ipv6.conf.lo.disable_ipv6=1
#vm.swappiness=10
#vm.vfs_cache_pressure=50

#!/bin/env bash
# Arquivo: codecs trusty 14.04
# Criado: Ter 10/Jun/2014 hs 14:05
# Last Change: Dom Jul 20, 2014  03:54
# autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# email: <voyeg3r  gmail.com>

# references:
# https://github.com/voyeg3r/dotfiles/blob/master/bin/codecs-precise.sh
# www.noobslab.com/2014/04/thingstweaks-to-do-after-install-of.html


# backup sources.list
sudo cp /etc/apt/sources.list{,.backup}


stopterminals(){
rename 's/$/.bak/g' /etc/init/tty[3-6].conf
sed -i.backup '/ACTIVE_CONSOLES=/s/1-6/1-2/g' /etc/default/console-setup
} && stopterminals

# disabling guest account
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'

# disable crash repots
sudo sed -i '/enabled/ s/1/0/g' /etc/default/apport && sudo service apport stop

fixetchosts () {
		cp /etc/hosts{,-backup}
		[ "`awk 'NR==1 {print $NF}' /etc/hosts`" == "`hostname`" ] || \
				sed -i "1s/\(.*\)/\1 `hostname`/g" /etc/hosts
} && fixetchosts


installaptfast () {
		# references: https://github.com/ilikenwf/apt-fast
		if ! which apt-fast >/dev/null; then
				# https://github.com/ilikenwf/apt-fast

				# aria2
				command -v aria2c || sudo apt-get -y install aria2

				# make backup
				cp /etc/apt-fast.conf{,-backup}

				# the script itself
				wget -c https://raw.githubusercontent.com/ilikenwf/apt-fast/master/apt-fast -O /usr/bin/apt-fast && chmod 0755 $_
				wget -c https://raw.githubusercontent.com/ilikenwf/apt-fast/master/apt-fast.conf -O /etc/apt-fast.conf

				# don't make questions
				sed -i 's/#DOWNLOADBEFORE=true/DOWNLOADBEFORE=false/g' /etc/apt-fast.conf

				# list of brazilian mirrors
				mirrors="https://launchpad.net/ubuntu/+mirror/ubuntu.c3sl.ufpr.br-archive,https://launchpad.net/ubuntu/+mirror/mirror.globo.com-archive,https://launchpad.net/ubuntu/+mirror/edugraf,https://launchpad.net/ubuntu/+mirror/mirror.unesp.br-archive,https://launchpad.net/ubuntu/+mirror/sft.if.usp.br-archive,https://launchpad.net/ubuntu/+mirror/ubuntu-archive.locaweb.com.br-archive,https://launchpad.net/ubuntu/+mirror/ubuntu.laps.ufpa.br-archive,https://launchpad.net/ubuntu/+mirror/www.las.ic.unicamp.br-archive"

				# zsh completions
				wget -c https://raw.githubusercontent.com/ilikenwf/apt-fast/master/completions/zsh/_apt-fast -O /usr/share/zsh/functions/Completion/Debian/_apt-fast
				chown root:root /usr/share/zsh/functions/Completion/Debian/_apt-fast
				source /usr/share/zsh/functions/Completion/Debian/_apt-fast

				# bash completions
				wget -c https://raw.githubusercontent.com/ilikenwf/apt-fast/master/completions/bash/apt-fast -O /etc/bash_completion.d/apt-fast
				chown root:root /etc/bash_completion.d/apt-fast
				#. /etc/bash_completion

				# man pages
				wget -c https://raw.githubusercontent.com/ilikenwf/apt-fast/master/man/apt-fast.8 -O /usr/share/man/man8/apt-fast.8
				gzip -f9 /usr/share/man/man8/apt-fast.8
				wget -c https://raw.githubusercontent.com/ilikenwf/apt-fast/master/man/apt-fast.conf.5 -O /usr/share/man/man5/apt-fast.conf.5
				gzip -f9 /usr/share/man/man5/apt-fast.conf.5

				# update and upgrade
				apt-fast update && apt-fast upgrade
		fi
} && installaptfast

compactadores(){
sudo apt-fast -y  install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller
} && compactadores

newgnomeshell(){
# source: http://askubuntu.com/questions/452864/how-to-get-gnome-shell-3-12-on-ubuntu-14-04
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo apt-fast update
sudo apt-fast dist-upgrade
sudo apt-fast -y install gnome-weather gnome-maps gnome-photos gnome-music
} && newgnomeshell

avoidoverheating(){
# source: http://itsfoss.com/things-to-do-after-installing-linux-mint-16-petra/
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-fast update
sudo apt-fast -y install tlp tlp-rdw
sudo tlp start
} && avoidoverheating

# control startup services
sudo apt-fast -y install bum

installprofilecleaner(){
# source: http://www.ubuntugeek.com/profile-cleaner-reduce-the-size-of-browser-profiles.html
sudo add-apt-repository ppa:graysky/utils
sudo apt-fast update
sudo apt-fast -y install profile-cleaner
} && installprofilecleaner

installprelink (){
sudo apt-fast install -y prelink
sudo sed -i.backup '/PRELINK/ s/unknown/yes/g' /etc/default/prelink
sudo /etc/cron.daily/prelinksudo sed -i.backup '/PRELINK/ s/unknown/yes/g' /etc/default/prelink
} && installprelink

# disabling some consoles
sudo sed -i '/ACTIVE_CONSOLES/s/1-6/1-2/g' /etc/default/console-setup
sudo apt-fast install -y zram-config

firefoxnightly (){
		sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
		sudo apt-fast update
		sudo apt-fast -y install firefox-trunk
} && firefoxnightly

renicefirefox(){
renice 15 $(pidof firefox)
renice 15 $(pidof firefox-trunk)
cat <<-EOF> /etc/cron.hourly/renicefirefox
#!/bin/sh
# http://www.thegeekstuff.com/2009/06/15-practical-crontab-examples/
echo renice 15 \`pidof firefox\`
echo renice 15 \`pidof firefox-trunk\`
EOF
chmod +x /etc/cron.hourly/renicefirefox
} && renicefirefox

# chromium browser
apt-fast install -y `apt-cache search chromium-browser | awk '{print $1}'`

synapselauncher (){
		# install synapse application launcher
		# reference: http://askubuntu.com/questions/449285/is-synapse-application-launcher-available
		sudo apt-add-repository ppa:synapse-core/testing
		sudo apt-fast update
		sudo apt-fast install -y synapse
} && synapselauncher

installgit (){
		# source: https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-14-04
		sudo apt-fast update
		sudo apt-fast install -y git
		sudo apt-fast install -y build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
} && installgit

installxclip (){
		sudo apt-fast -y install xclip
} && installxclip

# how generate new ssh key
# https://help.github.com/articles/generating-ssh-keys

# how install neovim on ubuntu
# http://robinlovelace.net/computing/2014/04/19/installing-neovim-on-ubuntu.html

installadmintools (){
		wget -c https://raw.githubusercontent.com/voyeg3r/dotfiles/master/gitconfig -O ~/.gitconfig
		sudo apt-fast install -y zsh vim-gnome vim-doc curl nmap aria2 ethtool gparted zsync openssh-server detox openssh-client
		# fasd
		wget -c  https://github.com/clvv/fasd/tarball/1.0.1
		tar zxvf 1.0.1 && cd 1.0.1
		PREFIX=$HOME make install
} && installadmintools

peerflixinstall(){
#peerflix é um cliente de stream de filmes via torrent
# http://www.edivaldobrito.com.br/peerflix-stream-de-torrents-de-videos-com-vlc-ou-mplayer-via-linha-de-comando/
# another important link
# http://forum.pinguyos.com/Thread-Stream-Torrents-with-VLC
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-fast update
sudo apt-fast -y install nodejs vlc xterm python-libtorrent wget
sudo npm install -g peerflix
[ -d ~/bin ] || mkdir ~/bin
wget https://raw.github.com/hotice/webupd8/master/Torrent-Video-Player -O ~/bin/Torrent-Video-Player && chmod +x $_
wget https://raw.github.com/hotice/webupd8/master/Magnet-Video-Player -O ~/Magnet-Video-Player && chmod +x $_
} && peerflixinstall

escalonandodiscos (){
		test -f /sys/block/sda/queue/scheduler && echo deadline > /sys/block/sda/queue/scheduler
		test -f /sys/block/sdb/queue/scheduler && echo deadline > /sys/block/sdb/queue/scheduler
		test -f /sys/block/hda/queue/scheduler && echo deadline > /sys/block/hda/queue/scheduler
} && escalonandodiscos

multimidia (){
		sudo apt-fast install -y audacity audacious audacious-plugins sox
		miro libavahi-compat-libdnssd1
		sudo apt-fast install -y ubuntu-restricted-extras vlc youtube-dl ffmpeg
		sudo apt-fast install gstreamer0.10-plugins-ugly libxine1-ffmpeg gxine mencoder libdvdread4 \
				totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 libavcodec-extra
		sudo /usr/share/doc/libdvdread4/install-css.sh

		sudo add-apt-repository ppa:mc3man/trusty-media
		sudo apt-fast update
		sudo apt-fast -y install gstreamer0.10-ffmpeg
} && multimidia

installminitube(){
sudo add-apt-repository ppa:noobslab/apps -y
sudo apt-fast update
sudo apt-fast -y install libqtgui4 libqt4-xml libqt4-network libqt4-dbus phonon-backend-vlc
sudo apt-fast install -y minitube
} && installminitube

installaudiorec () {
		sudo apt-add-repository ppa:osmoma/audio-recorder
		sudo apt-fast update && sudo apt-fast -y install audio-recorder
} && installaudiorec

graphic (){
		sudo apt-fast install -y gimp gimp-data-extras
		gimp-plugin-registry inkscape imagemagick pdftk gmic
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


		sudo apt-fast install -y `apt-cache search gnome-icon-theme | awk '{print $1}'`

		# enable midle mouse
		gsettings set org.gnome.settings-daemon.peripherals.mouse middle-button-enabled true

		sudo apt-fast install -y nautilus-open-terminal
} && changedesktop

othericons(){
# http://itsfoss.com/best-icon-themes-ubuntu-1404/
sudo add-apt-repository ppa:moka/stable
sudo apt-fast update
sudo apt-fast install -y moka-icon-theme
} && othericons

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

sudo apt-fast -y install deluge

installskype (){
		sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
		sudo apt-fast update
		sudo apt-fast -y install skype
} && installskype

googletalkplugin () {
		wget -q -O - https://dl-ssl.google.com/linux/laninux_signing_key.pub | sudo apt-key add -
		sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
		sudo apt-fast update
		sudo apt-fast install -y google-talkplugin
} && googletalkplugin

installpopcorntime (){
		wget https://raw.github.com/hotice/webupd8/master/popcorn-build
		chmod +x popcorn-build
		./popcorn-build
} && installpopcorntime

anotherpopcorntime(){
sudo add-apt-repository ppa:webupd8team/popcorntime -y
sudo apt-fast update
sudo apt-fast -y install popcorn-time
} && anotherpopcorntime

installtv-maxe(){
# reference: http://ubuntuhandbook.org/index.php/2014/05/install-sopcast-player-tv-maxe-ubuntu-1404/
sudo add-apt-repository ppa:venerix/pkg -y
sudo apt-fast update
sudo apt-fast -y install tv-maxe
} && installtv-maxe

# reference: http://caminholivre.wordpress.com/2014/06/12/instale-o-copy-no-ubuntu-e-derivados-atraves-de-ppa-2/
installcopy (){
sudo add-apt-repository ppa:paolorotolo/copy
sudo apt-fast update
sudo apt-fast -y install copy
} && installcopy

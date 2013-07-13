#!/bin/bash
# =================================================
#          CREATED: Qui 11/Jul/2013 hs 13:16
#      LAST CHANGE: 2013 Jul 11 13:25:25
# THIS SCRIPT AIMS: install apt-fast
#           AUTHOR: Sérgio Luiz Araújo Silva
#             SITE: http://vivaotux.blogspot.com
#          TWITTER: @voyeg3r
#            SKYPE: sergioaraujosilva
# =================================================

# testa se está logado como root
if [ "$(id -u)" != "0" ]; then
	echo "  Need be root"
	sleep 2
	exit  1
fi

command -v aria2 || sudo apt-get install aria2

git clone git://github.com/ilikenwf/apt-fast.git apt-fast
cd apt-fast

cp apt-fast /usr/bin/
chmod +x /usr/bin/apt-fast
cp apt-fast.conf /etc

cp completions/bash/apt-fast /etc/bash_completion.d/
chown root:root /etc/bash_completion.d/apt-fast
. /etc/bash_completion

cp ./man/apt-fast.8 /usr/share/man/man8
gzip -f9 /usr/share/man/man8/apt-fast.8
cp ./man/apt-fast.conf.5 /usr/share/man/man5
gzip -f9 /usr/share/man/man5/apt-fast.conf.5

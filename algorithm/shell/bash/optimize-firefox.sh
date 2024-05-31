#!/bin/bash
# Criado em:Dom 28/Nov/2010 hs 12:18
# Last Change: 2010 Nov 28 12:48:59
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: limpar o cache do firefox
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r

#optimizing Firefox sqlite databases
   if  [ -z "`whereis sqlite3 | awk '{print $2}'`" ]; then
       echo instale o sqlite3
       sleep 2
       exit 1
   fi


# checa se o processo do firefox está rodando no ambiente
# do usuário corrente
username=`whoami`
check_app () {
proc="`ps aux | grep $username | grep -v $0 | grep $1 | grep -v grep`"
if [ "$proc" != "" ]; then
    echo "!!! Shutdown $1 first!"
    exit 1
fi
}

check_app firefox

#optimizing Firefox sqlite databases
firefox="`find ~/.mozilla/ -iname "*.default"`"
opt_lock="$firefox/optimize-sqlite"
today=$(date +%F)

if [ -e $opt_lock ]
then
    last_run=$(ls -l $opt_lock | awk '{print $6}')
else
    last_run='1900-01-01'
fi

if [ $last_run != $today ]
then
    echo -n "Optimizing Firefox… "
    # no firefox 4 o arquivo de permissões é encriptado e o sqlite não 
    # consegue limpa-lo
    for i in `file *.sqlite | grep -v permissions | awk '{print $1}'`
    do
        sqlite3 $i vacuum
        echo -n '+'
    done
    echo
    touch $opt_lock
    echo "Done."
fi
cd ~/

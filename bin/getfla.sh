#!/bin/bash
# Autor: Daemonio (Marcos Paulo Ferreira)
# Contato: undefinido gmail com
#          daemoniolabs.wordpress.com
#
# [getfla.sh]
# Script que copia todos os videos flash abertos
# pelo  plugin do flash. Esse script foi feito
# para recupar arquivos de vídeos de sites
# como Youtube que "não estão" mais na pasta
# /tmp.
#
# obs: os vídeos são copiados para a pasta indicada
# na variável $PASTA.
#
# [Uso]
# $ ./getfla.sh
#
# [Exemplo]
# $ ./getfla.sh
# [+] Checando lista de arquivos abertos... Espere.
# [+] Copiando /proc/8403/fd/30 para /home/daemonio\
#             /FLV_Videos/video_2279.flv ... ok!
#
# OBS: Evite copiar e distribuir ilegalmente
#      videos protegidos (copyright).
#
# Versão 1.0 by daemonio @ Sun Jul 24 18:15:09 BRT 2011
# Versão 1.1 by daemonio @ Wed Dec 25 12:01:28 BRST 2013
#    + Uso do mktemp para gerar um nome aleatório
#

# Variáveis do script.
PASTA=${HOME}/docs/videos/FLV_Videos
MASKNAME='getfla-video-XXXXXXXXXX.flv'

# Cria a pasta de vídeos se possível, caso
# contrário finaliza o script.
if [ ! -d $PASTA ]
then
    read -p "Criar pasta \`${PASTA}' (y/n)? " q
    if [ "$q" = "y" ]
    then
        mkdir -p $PASTA
        [ ! -d $PASTA ] && exit
    else
        exit
    fi
fi

# Essa checagem realmente pode demorar um pouco ...
echo '[+] Checando lista de arquivos abertos... Espere.'

for PIDFD in $(lsof -n | grep 'FlashXX' | awk '{print $2"/fd/"$4}')
do
    # TODO: Passar isso para o awk. Mas
    # primeiro aprender AWK. :|
    PIDFD='/proc/'$(echo $PIDFD | sed 's/[^0-9]*$//')

    # Cria nome aleatório com mktemp. A opção
    # -u só gera o nome.
    DEST=$(mktemp -u "${PASTA}/${MASKNAME}")

    if [ ! -d $PIDFD ]
    then
        # Processo de copia.
        echo -n "[+] Copiando $PIDFD para $DEST ... "
        cp $PIDFD $DEST
        echo 'ok!'
    fi
done

#EOF

### Introdução
Execute o comando at para agendar uma atividade a ser executada apenas uma vez :

     $ echo 'comando -argumentos'| at 3:40 monday

Por exemplo, agendar o download de uma distro

echo "wget -c http://mirrors.uol.com.br/pub/kurumin/kurumin-7.0.iso" | at 01:00 tomorrow


### exibir mensagem visual temporizada

echo "DISPLAY=$DISPLAY xmessage cooker" | at "NOW + 30 minutes"

### despertador com mpg123

at 6:00 <<< "mpg123 ~/docs/musicas/u2/Boy/*.mp3"

outro despertador (alarme)

#!/bin/bash
# Criado em:Dom 23/Mai/2010 hs 09:41
# Last Change: Dom 23 Mai 2010 09:51:55 BRT
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: alarme
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

# para baixar o som: aria2c http://ubuntuone.com/p/4qs/

[ "$1" ] && hora="$1"  || read -p "digte a hora: "  hora


# local da musica que será tocada
musica=~/music/k3b_success1.wav

[ -e $musica ] || { read -p "digite o caminho completo para a musica: " musica ;}



at $hora <<< "play $musica"



### visualizar os agendamentos do comando at

atq




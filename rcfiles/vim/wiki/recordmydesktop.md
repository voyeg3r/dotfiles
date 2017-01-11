### Usando o recordmydesktop
O programa recordmydesktop funciona inteiramente pela linha de comando, há inclusive
um front-end para o mesmo chamado gtk-recordmydesktop

Para iniciar a gravacao

recordmydesktop introducao.ogv

Para parar a gravação

Ctrl-alt-s

Para pausar a gravação

Ctrl-alt-p

Para gravar uma janela específica pegue o ID da mesma com o comando:

xwininfo  | awk '/Window id:/ {print $4}'
!!!! Obs: clique na janela para completar a ação



recordmydesktop --windowid $(xwininfo | awk '/Window id:/ {print $4}')
recordmydesktop --windowid "id-da-janela"

### Script para capturar video de janela

#!/bin/bash
# Criado em:Sex 29/Jan/2010 hs 17:18
# Last Change: Sex 29 Jan 2010 17:20:34 BRT
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: <+nome+>
# Proposito do script: <+descreva+>
# Autor: <+seuNome+>
# site: <+seuSite+>

echo "pegando o id da janela..."
sleep 1

echo "clique na janela para pegar o id da mesma..."
sleep 1
idjanela=`xwininfo  | awk '/Window id:/ {print $4}'`

recordmydesktop -windowid $idjanela


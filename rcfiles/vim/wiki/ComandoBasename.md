### Introdução
Se utilizar o comando abaixo em um script ele retorna o
caminho completo com o nome

 echo "arquivo $0"

supondo que o nome do arquivo seja 'brilho' e que
o caminho seja

 /home/user/bin/

O retorno seria

 arquivo /home/user/bin/brilho

usando basename tería-mos

  echo "arquivo `basename $0`"
  arquivo brilho

### script de exemplo

# Criado em:Dom 26/Out/2008 hs 12:11
# Last Change: Dom 26/Out/2008 hs 12:11
# Instituicao:
# Proposito do script: controlar o brilho do notebook
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

# verifica a existência do programa xbacklight
if [ ! -e /usr/bin/xbacklight ];
then
echo " Você deve instalar primeiro o programa xbacklight"
sleep 3
exit
fi

# função que mostra como usar o programa
usage () {
echo " ============================================================"
echo " programa `basename $0`"
echo " como usar: `basename $0` 25"
echo " como usar: `basename $0` valor"
echo " ============================================================"
sleep 3
clear
exit
}

# se não for digitado o argumento mostrar como usar
if [ -z "$1" ];
then
usage
fi

xbacklight -set $1


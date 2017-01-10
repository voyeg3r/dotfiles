### Introdução
Exibe o espaço livre 'disck free'

df -H

O comando acima gera uma saida mais ou menos assim:

Filesystem     Size   Used   Avail  Use%  Mouted on
/dev/sda1      9,8G   3,8G    5,5G   41%  /

A combinação de comandos permite coisas do tipo

PENDRIVE=$(df |grep sdb|awk '{print $NF}')



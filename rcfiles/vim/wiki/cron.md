### Introdução
O cron (vem de cronologia) funciona assim:

# minuto hora dia-do-mes mes dia-da-semana comando
00 03 0 0 0 rm -rf /tmp/*

   52  18    1   *   *    root     run-parts --report /etc/cron.montly
   |   |     |   |   |      |      |
   |   |     |   |   |      |      \_Comando que será executado
   |   |     |   |   |      |
   |   |     |   |   |      \_ UID que executará o comando
   |   |     |   |   |
   |   |     |   |   \_ Dia da semana (0-7)
   |   |     |   |
   |   |     |   \_ Mes (1-12)
   |   |     |
   |   |     \_ Dia do Mês (1-31)
   |   |
   |   \_ Hora
   |
   \_ Minuto

O comando acima limpará a pasta /tmp
todos os dias às 03:00h

### sempre usar caminho completo no cron

quando referenciar scripts use o caminho completo, no cron não há como definir path

### atualizar a hora

# manter o relogio certo
0 * * * * /usr/sbin/ntpdate -s ntp.usp.br
# minuto hora dia mˆes dia da semana comando

# Para executar o mesmo comando com um intervaldo
# de 4 horas entre cada execucao, poderiamos fazer:
# minuto hora dia mˆes dia da semana comando
0 */4 * * * /usr/sbin/ntpdate -s ntp.usp.br

### executar um comando a cada 15 minutos

*/15 * * * * /path/to/command

### limpar thumbnails antigos
a cada trinta minutos verifica e limpa os thumbnails com mais de
três dias de acesso.

*/30 * * * * find ~/.thumbnails -type f -atime +3 | xargs rm -f

### visualizando o conteúdo da tabela cron

crontab -l

### algumas dicas sobre o cron

Mudando o papel de parede

Apparently gsettings needs some variables to be set. Because CRON uses only a very restricted set of environment variables you must set them before your script. Use the following code in your CRON line.

30 */2 * * * DISPLAY=:0 GSETTINGS_BACKEND=dconf /your/path/your-script.sh


### editando a tabela do cron

crontab -e


Se você exportou as chaves ssh para outro computador pode até fazer um backup
assim:

00 02 0 0 0 rsync -avz /backup/ root@servidor:/root/backup/

Veja como exporta a chave ssh

ssh-keygen -b 1024 -t dsa
ssh-copy-id -i ~/.ssh/id_dsa.pub usuario@maquina_remota


script para limpar o cache do squid

#!/bin/bash
# Criado em:qua 22/out/2008 hs 08:42
# Last Change: Qui 23 Out 2008 10:26:44 BRT
# Instituicao: FUNCET - SECULTFOR
# SECRETARIA DE CULTURA DE FORTALEZA
# Proposito do script: limpar cache do squid
# Autor: Sergio Luiz Araujo Silva
# site: http://vivaotux.blogspot.com

# data=`date +%d/%m/%Y`
# hora=`date +%H:%M`

# você pode agendar este script assim
# crontab -e
# 0 2 15 0 0  /root/bin/limpasquid.sh

# parando o serviço do squid
echo "  Parando o serviço squid..."
/etc/init.d/squid stop
echo "  Squid parado!"

# zerando os logs
cd /var/log/squid
echo
echo "==============================================================="
echo "limpeza do proxy executada em `date +%d/%m/%Y`" >> limpasquid.log
echo "hora de execucao: `date +%H:%M`" >> limpasquid.log
echo "==============================================================="
echo
echo > access.log
echo > store.log
echo > cache.log

# limpando o cache do squid
echo "  Limpando o cache do squid..."
rm -rf /var/spool/squid/*
echo "  O cache do squid está limpo!"

# recriando a extrutura de pastas do squid
echo "  Recriando a extrutura de pastas do squid"
squid -z

# reiniciando o proxy squid
echo "  Iniciando o squid"
/etc/init.d/squid start

echo "  Pronto, o cache foi recriado"



### Referências
* http://www.devin.com.br/tlm4/s1-agendando-crontab.html

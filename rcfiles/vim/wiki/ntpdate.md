
su -
# apt-get install ntpdate
Escolheremos como fornecedor de hor´ario confi´avel o seguinte servidor: ntp.usp.br
# ntpdate -s ntp.usp.br
# date

### usando o cron para ativar o ntpdate


# manter o relogio certo
0 * * * * /usr/sbin/ntpdate -s ntp.usp.br
# minuto hora dia mˆes dia da semana comando



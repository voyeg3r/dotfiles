Arquivo: gerenciando serviços no linux chkconfig e service
Criado: Ter 04/Jan/2011 hs 20:38
Last Change: 2011 Jan 04 21:08:11
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r

Fonte:

Chkconfig - É usado para manipular o runlevel dos serviços durante o boot

    --terse

é usado para listar o estado de serviços especificos

    # chkconfig -t sudo

saída:

sudo on

    --list

    # chkconfig --list

mostra uma lista detalhada dos serviços, e em qual runlevel eles iniciam, uma linha da saída:

samba                     0:off  1:off  2:off  3:off  4:off  5:off  6:off

    --add

Adiciona um serviço existente no sistema

    # chkconfig --add sshd

    --del

Deleta um serviço existente no sistema

    # chkconfig --del sshd

    --level

Muda o runlevel de inicialização do serviço

    # chkconfig --level 234 sshd

ps: não deixe os serviços no 0 ou no 6

opções on e off

Ativa e desativa o serviço em questão

    # chkconfig ssh on > o serviço foi ativado
    #chkconfig ssh off > o serviço foi desativado

Assim você pode controlar facilmente o que inicia ou não no seu sistema, é uma
forma tambem de aumentar a segurança, porque você vai deixar o sshd ativado se
não usa? Ele não vem instaldo por padrão nas distros então para distros Debian
e similares de o comando

    # apt-get install chkconfig

SERVICE

service - Esse comando pode basicamente ativar desativar, reiniciar, e ver a situação do serviço

    start

Inicia um serviço parado

    # service sshd start

    stop

Para um serviço

    # service sshd stop

    restart

Reinicia um serviço

    # service sshd restart

    --status-all

Mostra uma lista dos serviços do sistema, e a situação deles

    # service --status-all

    status

Mostra o estado do serviço especificado

    # service sshd status


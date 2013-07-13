#!/bin/sh
# Criado em:Qui 05/Jan/2006 hs 13:13
# ultima modificação: Sex 03 Fev 2006 20:17:48 BRST
# Ativar NUMLOCK na inicialização do sistema.
# André C|-|@k4L - chakal@linuxmail.org - Debian GNU\Linux 3.0

# Este é um simples script que ativa o NUMLOCK na inicialização do sistema.
# Por padrão o NUMLOCK fica desativado na incialização, para que ele funcione
# voce deve colocá-lo na pasta /etc/init.d/ do seu sistema e gerar um link dele
# dentro da pasta "rc" que por padrão você inicia. Ex:
# ln -sf /etc/init.d/numlock /etc/rc3.d/S20numlock

# Cores
verde="setterm -foreground green"
normal="setterm -default"

# Script

echo -n "Ativando NumLock..."
sleep 1

INITTY=/dev/tty[1-8]
for tty in $INITTY; do
    setleds -D +num < $tty
done

echo -n "	[  "
$verde
echo -n "OK"
$normal
echo "  ]"

# FIM

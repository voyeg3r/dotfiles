//{$revisionyear}//
### Introdução Vc pode usar o comando trap para impedir que os
ctrl+c/ctrl+z te causem problemas.  A sintaxe do comando trap é a
seguinte:


trap [função_a_ser_executada] número_do_sinal


Se não for informado a "função_a_ser_executada" o script não mais
reconhecerá o sinal equivalente, por exemplo se você desejar que seu
script desabilite o sinal de interrupção "^C" Ctrl+C ou SIGINT 2
utilize o comando: trap 2

Script de Exemplo:

#!/bin/bash
# Função que remove os arquivos temporários

remove_temp()
{
echo "Removendo arquivos temporários"
rm -f /tmp/lixo001
exit
}



# O comando trap deverá estar no início de seu script
# quando o usuário interromper o script primeiro ele
# irá executar a função remove_temp

trap remove_temp 2




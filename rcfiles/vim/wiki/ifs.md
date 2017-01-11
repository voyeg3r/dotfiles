### Breaking up a string is what IFS is used for:

OLDIFS=$IFS
IFS=. read -a ip_elements <<< "127.0.0.1"

echo ${ip_elements[@]}
IFS=$OLDFS



uma solução legal com este método

    http://br.groups.yahoo.com/group/shell-script/message/36149

estou lendo um csv gigantesco, e preciso separar vários campos em variáveis
distintas:



SG_UF=`echo "$REGISTRO_ATUAL" | cut -d";" -f15`
CO_CEP=`echo "$REGISTRO_ATUAL" | cut -d";" -f17`
NU_DDD=`echo "$REGISTRO_ATUAL" | cut -d";" -f18`
NU_TELEFONE=`echo "$REGISTRO_ATUAL" | cut -d";" -f19`
DT_NASCIMENTO=`echo "$REGISTRO_ATUAL" | cut -d";" -f39`

dentre outros
só que isso em larga escala (arquivos com mais de 1milhao de registros)
fica extremamente lento.

Existe alguma forma de atribuir essas variáveis de outra forma?



OLDIFS=$IFS
Var='1;2;3;4;5;6'
IFS=\; read a b c d <<< "$Var"
echo -e "$a\n$b\n$c\n$d"
1
2
3
4;5;6
IFS=$OLDFS

O comando if testa condições
### Introdução

# testa se o usuário é root
# != significa diferente
if [ "$USR" != "root" ]; then
   echo '  Você não é root!'
fi

# testa se uma pasta existe
if [ ! -d ~/bin ]; then
   mkdir ~/bin
fi
cd ~/bin

# Obs: a exclamação é uma negação:
# ! -d  = (se não existe o diretório ~/bin)
# Outro modo de testar se uma pasta existe
[ -d ~/bin ] || mkdir ~/bin ; cd ~/bin

Dica do Piter Punk

$var = (isset($var)) ? $var : 10;
# Simples, mas evita você ter que escrever:
if( isset($var) )
        $var = $var;
else
        $var = 10;

### Testando com opcionais ou expressõs regulares

if [[ expression1 || expression2 ]]; then do_something; fi
if [[ string =~ regex ]]; then do_something; fi

### um modo inusitado de testar

[ "$1" ] || { echo "Uso: $0 parâmetro" ; exit 1 ; }




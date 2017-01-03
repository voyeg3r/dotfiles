O comando id pode ser usado por exemplo em um script que só pode ser executado como root

# testa se está logado como root
if [ "$(id -u)" != "0" ]; then
    echo "  Need be root"
    sleep 2
    exit  1
fi

A opção -u do comando id testa a identificação numérica do usuário  corrente
que no caso do root corresponde a zero
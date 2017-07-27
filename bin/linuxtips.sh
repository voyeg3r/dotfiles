#!/usr/bin/env bash
# Created: 2017-07-26 14:57
# Last Change: sex 04 nov 2016 16:02:43 BRT
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: instituicao
# Proposito do script: give me command tips
# Autor: Sergio Araujo
# site: http://vivaotux.blogspot.com
# github: @voyeg3r
# e-mail: <voyeg3r ✉ gmail.com>

# press Ctrl-j to jump placeholder
cd .vim/wiki

CMD=$(sed -n '/^\[/p' ~/.vim/wiki/comandoslinux.md | shuf -n 1 | sed 's,^.*(\([^)]*\)),\1,g' )


echo "=================================================="
       echo "Dicas do comando $CMD"
echo "=================================================="


if [ ! -f "$CMD" ]; then
    echo "O arquivo $CMD não existe no wiki"
    read -r -p "Gostaria de edita-lo? [Y/n]: " response
    response=${response,,} # tolower
    if [[ $response =~ ^(yes|y| ) ]] || [ -z $response ]; then
        echo vim "$CMD"
        vim "$CMD"
    fi

    read -r -p "Gostaria de remove-lo do índice? [Y/n]: " response
    response=${response,,} # tolower
    if [[ $response =~ ^(yes|y| ) ]] || [ -z $response ]; then
        echo sed -i "/$CMD/d" comandoslinux.md
        sed -i "/$CMD/d" comandoslinux.md
        exit 1
    fi
    exit 1
fi

RGNUNBER=$(awk 'BEGIN { RS="/#+.*$/"; FS="$"} {print NF}' $CMD)

PRINTREG=$(shuf -i 1-$RGNUNBER -n 1)
echo "Valor fornecido pelo shuf $PRINTREG"
echo "$CMD Contém $RGNUNBER registros"
echo "O Registro a ser impresso é o $PRINTREG"

#REGISTER=$(awk -v min=1 -v max=$RGNUMBER 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
REGISTER=$(awk -v min=1 -v max=$PRINTREG   'BEGIN{srand(); print int(min+rand()*(max-min+1))}')

echo "O Registro escolhido foi $REGISTER"

awk -v var=$REGISTER 'BEGIN { RS="/#+.*$/"; FS="$"} {print $var}' $CMD | less


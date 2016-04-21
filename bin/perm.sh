#!/bin/bash
# Criado em :Sáb 07/Fev/2009 hs 09:46
# Last Change: Seg 18 Abr 2016 10:04:55 BRT
# vim:ft=sh:fdm=syntax:nu:
# Proposito do script: consertar permissões de arquivos
# Autor: Sérgio Luiz Araújo Silva
# site: vivotux.blogspot.com

# Este script usa um conceito chamado "Here Documents"
# que significa ao pé da letra "documento aqui", há uma
# variação deste comando chamdo "Here strings" que
# tem uma sutil diferença

clear
cat <<-EOF

    +===========================================================+
    |           SCRIPT PARA CONSERTAR PERMISSÕES                |
    +===========================================================+
    |                                                           |
    | Este script foi desenvolvido para consertar permissões    |
    | de arquivos principalmente quando você copiar algo de um  |
    | DVD ou CDRoom e aparecer no seu Desktop aquele monte      |
    | de pastas com ícone do cadeado!                           |
    |                                                           |
    | Caso obtenha erro talvez você tenha que recorrer          |
    | ao comando chown, para mis detalhes:  man chown           |
    +===========================================================+

EOF

echo "    tornando sua pasta pessoal exclusiva..."
chmod 700 ~

echo "    tornando arquivos leitura e escrita"
find ./ -type f -print0 | xargs -0 chmod +rw

echo "    tornando pastas amplamente acessíveis (rwx)"
find ./ -type d -print0 | xargs -0 chmod 700
echo
sleep 3
exit


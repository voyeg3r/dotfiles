
13 comandos básicos yaourt para você gerenciar melhor os pacotes do AUR | Linux Descomplicado

http://www.linuxdescomplicado.com.br/2015/10/13-comandos-basicos-yaourt-para-voce-gerenciar-melhor-os-pacotes-do-aur.html

1 – Instalar ou atualizar um pacote

    yaourt -S pacote

2 – Instale um pacote local ou a partir da web

    yaourt -U / caminho_do_pacote

3 – Encontre um pacote

    yaourt pacote

4 – Informação sobre um pacote instalado

    yaourt -Qi pacote

5 – Obter informações sobre um pacote nos repositórios

    pacote -Si yaourt

6 – Remover um pacote (uninstall)

    yaourt -R pacote

7 – Remover um pacote e suas dependências que não são necessários a outro pacote instalado

    yaourt -Rs pacote

ATENÇÃO: Esta operação é recursiva, e deve ser usado com muito cuidado, pois poderia eliminar um pacote principal e corromper o sistema

8 – Remover um pacote e suas dependências e todos os pacotes que dependem dele

    yaourt -Rsc pacote

9 – Remover um pacote que é exigido por outro, sem retirar suas dependências

    yaourt -Rdd pacote

10 – Atualizar os pacotes de banco de dados

    yaourt -Syy

11 – Limpar o cache de pacotes

    yaourt -Scc

12 -Atualizar o sistema

    yaourt -Syu

13 – A atualização do sistema, incluindo pacotes do AUR instalados

    yaourt -Syua

### Fixing yaourt after pacman update

New version of Pacman released: Updating yaourt and package-query

Pacman 5.0.0 has been released, and for those of us who use it along with yaourt, that means a pacman -Syu willl temporarily be unable to satisfy its dependencies. The reason is that your system’s version of package-query will prevent you from updating to the latest pacman.

Most among you will probably find it easy to upgrade, but if you’re feeling fuzzy or made a little error on the way (causing you to fail to load the shared library libalpm.so.9..), here’s how to do it asap:

    # remove problematic packages:
    sudo pacman -Rdd package-query yaourt
    # make sure to update pacman here:
    sudo pacman -Syu
    # get the latest PKGBUILD for package-query and yaourt:
    git clone https://aur.archlinux.org/package-query.git
    git clone https://aur.archlinux.org/yaourt.git
    # compile and install
    cd package-query && makepkg -sri && cd ..
    cd yaourt && makepkg -sri

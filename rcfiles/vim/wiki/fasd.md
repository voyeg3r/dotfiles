Site oficial -->  https://github.com/clvv/fasd

### O que é o comando fasd?

Fasd (pronounced similar to "fast") is a command-line productivity booster.
Fasd offers quick access to files and directories for POSIX shells. It is
inspired by tools like autojump, z and v. Fasd keeps track of files and
directories you have accessed, so that you can quickly reference them in the
command line.

The name fasd comes from the default suggested aliases f(files),
a(files/directories), s(show/search/select), d(directories).

Fasd ranks files and directories by "frecency," that is, by both "frequency"
and "recency." The term "frecency" was first coined by Mozilla and used in
Firefox (link). https://goo.gl/Ps1d2B

### Como instalar o fasd

Para instalar basta clonar o repositório

    git clone git://github.com/clvv/fasd.git

    depois entra na pasta

      cd fasd
      sudo make install

Criando os aliases:


    ########### aliases para o fasd_cd ##########
    # aliases para fasd
    alias a='fasd -a' # any
    alias s='fasd -si' # show / search / select
    alias d='fasd -d' # directory
    alias f='fasd -f' # file
    alias vf='vim $(fasd -f)'
    alias sd='fasd -sid' # interactive directory selection
    alias sf='fasd -sif' # interactive file selection
    alias z='fasd_cd -d' # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection
    alias v='f -e vim' # open file with vim
    alias v='f -t -e vim -b viminfo'
    alias o='a -e xdg-open' # quick opening files with xdg-open
    alias _!='fc -e "sed -i -e \"s/^/sudo /\""' # sudo last command


Daí você só vai ter que digitar os comandos tipo...

   cd /run/media/sergio/172B-FF6F

...uma vez

Porque o fasd_cd memoriza e é capaz de completar nomes assim:

   z 17   (note que 17 faz parte do caminho digitado acima)

``` sh
cp `f .vimrc` `d 17`
```

Alguns comandos úteis do fasd_cd

    v post install    ---- abrirá meu arquivo archlinux-post-install-script
    s post install ....... mostra o local do meu arquivo de post instal
    cp `f .vimrc` .  copia meu vimrc para a pasta atual de onde eu esteja
    z collec ............ entra na minha pasta collection.media do anki
    d collec   .......... mostra minha pasta collection.midia do anki
    o `sf pdf` .......... abrir arquivos pdf interativamente xdg-open

### Localizando um alias

o comando "$(f aliases)" executa o chamada ao comando fasd que localiza o arquivo aliases
que tenho guardado em ~/.dotfiles/rcfiles/zsh/aliaes, passando então o valor como
parãmetro para o grep

``` sh
grep 'lower' `f aliases`
```



# some aliases examples

``` markdown
File:		 alias
Created:	 ter 10 jan 2017 19:06:40 BRT
Last Change: ter 10 jan 2017 19:06:44 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

``` zsh
alias aedit="$EDITOR $ZSH_CONFIG/aliases; source $ZSH_CONFIG/aliases"

# source: https://www.reddit.com/r/linux/comments/3ly2zl/lpt_use_python_interpreter_as_an_advanced/
alias calc='python3 -ic "from math import *; import cmath"'

alias xterm='xterm -rv'
# alias calc='noglob calc'

alias path="echo ${PATH//:/$'\n'}"
alias fpath="echo ${fpath// /$'\n'}"
alias shell='echo ${SHELL:t}'
```

# Introdução



Um aliás é um apelido, geralmente uma abreviação para um comando
mais longo, por exemplo:

### se tenho que logar via ssh assim
``` sh
ssh sergio@server:/home/sergio
```
posso criar um alias para isto assim:

    alias sshsergio="ssh sergio@server:/home/sergio/"

dessa forma eu posso agora usar somente

    sshsergio

### Como saber se um comando tem aliases?
fonte: http://www.commandlinefu.com/commands/view/2299/find-if-the-command-has-an-alias

``` sh
type -all comando
type -all ls
```

### alias para limitar o apt
Lembre-se que como o apt só roda como root o alias deve ser colocado
no ambiente do root

    alias apt-get="apt-get -o Acquire::http::Dl-Limit=25"

### Mas onde coloco um aliás para que permaneça?
edite o arquivo .bashrc (note que é um arquivo oculto), o mesmo
fica em seu home.


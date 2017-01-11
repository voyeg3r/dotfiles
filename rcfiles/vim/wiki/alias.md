### Introdução
Um aliás é um apelido, geralmente uma abreviação para um comando
mais longo, por exemplo:

se tenho que logar via ssh assim

       ssh sergio@server:/home/sergio

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
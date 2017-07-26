### Introdução
Este é um comando para criação de pastas

  mkdir pasta

### copiando uma estrutura de pastas (somente pastas)

    (cd /home/user/source/; find -type d -print0) | xargs -0 mkdir -p

### criando com permissão

    mkdir -m 755 /shared

### criando uma pasta com data

    mkdir $(date +%d-%m-%Y)

# outra opção

    mkdir backup-`date -I`

Para mais detalhes veja o comando [[date]]
### Criando uma extrutura completa
[[image:pastas.png]]


    mkdir -p docs/{img/{fotos,icons,wallpapers,svg},textos/{artigos,man},tmp}

    mkdir -p backups/{sales,development,hr}/{jan,fev,mar,abr,mai,jun,jul,ago,set,out,nov,dez}/{dom,seg,ter,qua,qui,sex,sab}



    mkdir -p project/{lib/ext,bin,src,doc/{html,info,pdf},demo/stat/a}


Podemos criar pastas sob demanda

  [ -e ~/tmp ] || mkdir ~/tmp ; cd ~/tmp
  # existe ~/tmp? se não crie, em seguida entre na mesma


### se obtiver erro ao entrar numa pasta

    $ cd /home/user/foo

    cd: /home/user/foo: No such file or directory

$ mkdir !*

    mkdir /home/user/foo


### criando uma pasta e entrando na mesma

    function mkcd () { mkdir -p "$@" && cd "$@"; }

### cirando 100 pastas de 000 a 100

    mkdir $(printf "%03d " {1..100})

outro modo

    mkdir 0{0..9}{0..9};mv 000 100

também poderia ser

    for i in `seq -w 100`; {
       mkdir $i
    }

### veja também
* O comando [[install]]
* http://br.groups.yahoo.com/group/shell-script/message/31892
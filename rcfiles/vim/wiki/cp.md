### Introdução
copia arquivos e/ou diretórios

     cp -r /pasta /destino/

A opção -u faz update

     cp -uvfa origem destino

    Update, verbose, force, a=dpR


### Copiando o mesmo arquivo para três pastas diferentes

    echo dir1 dir2 dir3 | xargs -n 1 cp -v arquivo.txt

### copiando estrutura de pastas (somente a extrutura)

    ``` bash
    (cd /home/user/source/; find -type d -print0) | xargs -0 mkdir -p

    rsync -a --include='*/' --exclude='*' ${source} ${destination}
    ```

### copiando e entrando na pasta

    cp file ~/tmp
    cd Alt .
ou
    cp file ~/tmp && cd $_

### Opções interessantes

     cp -a /origem /destino

no caso acima a opção '-a' equivale a '-dpR'
sempre recomendada para fazer backups, para mais detalhes
leia o manual do cp

    man cp

### Criando backup de arquivos de configuração

    cp /etc/resolv.conf{,.bak}

    sudo cp /etc/rc.conf{,-old}

Putting nothing before the comma will just append -old to the filename after
copying it with cp. If your new file doesn't work out and you want to restore
the backed up file to its original location, you can just use:

    sudo mv /etc/rc.conf{-old,}

### varias copias

    for i in {1..5}; do cp test{,$i};done

### conbinando com o find
Use -t when using find and cp
-t, --target-directory=DIRECTORY (copy all SOURCE arguments into DIRECTORY).

    find . -name "*.pdf" -print0 | xargs -0 cp -t downloads/

Caso não usassemos a opção -t (que indica destino) o comando seria algo assim:

find /originalPath/ -iname \*.mp3 -print0 | xargs -0 -i cp ./{} /destinationPath/

### combinando com o ls

    ls *.jpg | xargs -n1 -i cp {} /external-hard-drive/directory

### copy files without extension

    ``` zsh
    cp -- !(*.txt|*.c|*.py) /path/to/directory
    ```

### sintaxe

    ln [opções] alvo linkname

#### Quando instalamos o inkscape manualmente tipo:

    sudo tar jxvf firefox3.5.tar.bz2 -C /opt

#### podemos criar os links assim

    ln -sfvn /opt/firefox/firefox /usr/bin/firefox

    -s ......... link simbólico
    -f ......... force
    -v ......... verbos
    -n ......... no-derefence


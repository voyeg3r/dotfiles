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

### saving some keystrokes with shell tricks

    echo um{,-2.91}.sh

    ln -s /etc/profile.d/{vte,vte-2.91}.sh

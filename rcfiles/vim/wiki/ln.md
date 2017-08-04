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
    
### linking only hidden files creating a non hidden symlink

    for i in  `ls -al | grep '^-' | awk '{print $NF}'`; do
        ln -sfvn $i ${i/./}  
    done
    
    'zimrc' -> '.zimrc'
    'zlogin' -> '.zlogin'
    'zshenv' -> '.zshenv'
    'zshrc' -> '.zshrc'
    
    -a  ................ all files (including hidden files and folders)
	-l  ................ long 
	'^-' ............... only files will start with -
	'{print $NF}' ...... show the last field 
    ${i/./} ............ removes dot at link name

### Showing only hidde files and folders (one per line)

	ls -A | grep '^\.'
	
	# ZSH way to solve ths problem?
	
	ls *(.D)
	
       .zlogin  .zlogin.swp  .zshenv



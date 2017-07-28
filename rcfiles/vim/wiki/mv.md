### Introdução
mover um arquivo para um nível acima

    mv arquivo ..

### Economizando digitação

    mv /path/to/file.{txt,xml}

    sudo cp /etc/rc.conf{,-old}

Putting nothing before the comma will just append -old to the filename after
copying it with cp. If your new file doesn't work out and you want to restore
the backed up file to its original location, you can just use:

    sudo mv /etc/rc.conf{-old,}

### combinando o mv com o [[find]]

    find ./ -maxdepth 1 -iname "*.txt" -print0 | xargs -0 mv -t ~/tmp

# adicionando extensão

    find ./ -maxdepth 1 -type f -print0 | xargs -0 -i mv ./{} ./{}.txt

    prename 's/.txt$/.md/' *
    prename 's/$/.txt' *

# movendo arquivos

    find ~/ -iname "*.txt" | xargs mv -t ~/tmp

### consertar utf8 para iso
* http://www.mycomputerhelps.org/linux-user/how-to-batch-repair-file-and-folder-names-encoding-on-windows-after-a-windows-linux-file-transfer.html
* veja também : http://www.diegolima.org/wordpress/?p=24

Assuming you want to convert the filenames from
ISO to UTF8 then here is a possible solution. Open
 a shell and cd into the base of the directory structure
 you want to convert. Then paste the following in a single line first:

for name in `find . -depth `; do new_name=`echo $name | iconv -f ISO-8859-1 -t UTF-8`; [ "$new_name" != "$name" ] && echo “$name => $new_name”; done


Once you’ve verified that it’s going to do
the right thing, then paste and execute this:

for name in `find . -depth `; do new_name=`echo $name | iconv -f ISO-8859-1 -t UTF-8`; [ "$new_name" != "$name" ] && mv “$name” “$new_name”; done


If you are more comfortable working with a shell
script in a file, here’s the same thing broken out
to separate lines you can put in a file to execute.
Don’t forget to chmod it after you create it.


#!/bin/sh

for name in `find . -depth `; do
new_name=`echo $name | iconv -f ISO-8859-1 -t UTF-8`
# new_name=`echo $name | iconv -f UTF-8 -t ISO-8859-1`
if [ "$new_name" != "$name" ]; then
echo “$name => $new_name”
# mv “$name” “$new_name”
fi
done
### END SCRIPT


Start out with the move (mv) line commented out to
make sure it’ll do the right thing before it changes
anything. Then, uncomment that line and run again to
actually rename the files. You can reverse the conversion
(UTF-8 to ISO-8859-1 instead of ISO-8859-1 to UTF-8)
 by switching the parameters for the iconv command.
 I’ve put the commented line so you can swap between
 the two options. Just comment out one or the other.

Good luck.

### trocar a extensão de arquivos

    for i in *.html; do mv $i ${i%.html}.htm; done
    for i in `ls *.GIF`; do mv $i ${i/.GIF/.gif}; done

### retirando espaços

    for i in `ls *`; do mv $i ${i// /_/}; done

### veja também
comando [[rename]]




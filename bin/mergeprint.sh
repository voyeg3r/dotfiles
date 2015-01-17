#!/bin/bash
# Criado em:Mon 30/May/2011 hs 12:24
# Last Change: Sat Jan 17, 2015  07:30AM
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: Inkscape print merge
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r

# REFERENCES:
# http://zkwarl.blogspot.com/2006/08/inkscape-tip-use-inkscape-on-command.html
# http://www.unixnotes.org/2007/06/14/incrementar-variavel-numerica-em-bash2/
# http://www.debianadmin.com/combine-multiple-pdfs-into-one-file-in-ubuntu-linux.html
# http://wiki.bash-hackers.org/scripting/style

# dependences gs and pdftk
NEEDED_COMMANDS="pdftk gs"
missing_counter=0
for needed_command in $NEEDED_COMMANDS; do
	if ! hash "$needed_command" >/dev/null 2>&1; then
		printf "Command not found in PATH: %s\n" "$needed_command" >&2
		((missing_counter++))
	fi
done
if ((missing_counter > 0)); then
	echo "instale os programas: $NEEDED_COMMANDS"
	exit 1
fi

# create directory to put all files
echo "Creating mergeprint directory"
mkdir mergeprint
cd mergeprint


count=1

for i in `echo {0001..0167}`; do
	echo "Creating file${i}.svg"
    cat  ../cartoes.svg > file${i}.svg
    echo "Changing merge fields to file${i}.svg"
	sed -i "s/label1/`printf \"%04d\" $count`/" file${i}.svg && count=$((count+1))
	sed -i "s/label2/`printf \"%04d\" $count`/" file${i}.svg && count=$((count+1))
	sed -i "s/label3/`printf \"%04d\" $count`/" file${i}.svg && count=$((count+1))
	sed -i "s/label4/`printf \"%04d\" $count`/" file${i}.svg && count=$((count+1))
	sed -i "s/label5/`printf \"%04d\" $count`/" file${i}.svg && count=$((count+1))
	sed -i "s/label6/`printf \"%04d\" $count`/" file${i}.svg && count=$((count+1))

	# to learn how export in onther formats read 'man inkscape'
	echo "exporting file${i}.svg to file${i}.pdf"
	inkscape -f file${i}.svg -A file${i}.pdf
done

cd ..
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combinedpdf.pdf -dBATCH ./mergeprint/*.pdf

echo "Removing work directory..."
rm -rf ./mergeprint



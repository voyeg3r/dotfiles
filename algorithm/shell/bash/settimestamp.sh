#!/usr/bin/env bash
# Filename: settimestamp.sh
# Last Change: Thu, 21 Jul 2022 13:15

# script para alterar timestamp de arquivos internamente
# ou seja, a string da data de alteração contida no arquivo reflete
# a data de alteração no disco

# if the wiki (our target foler in this particular case) is in a subfolder we usa a subshell, this way
# after running the script you will be right back on your original folder
# NOTE: to keep the original timestamp when copying files use `cp -rp folder destiny`

(
cd ~/.dotfiles/wiki || exit
for file in *.md; do
    echo "Modificando o arquivo $file .."
    t=$(stat -c "%y" "$file") # original timestamp
    new_date=$(date -r "$file" +'%a, %d %b %Y - %H:%M:%S')
    sed -i "1,7s/\(Last Change: \).*/\1 $new_date/g" "$file"
    # sed -i '1,7{/^[Cc]reated:/d}' "$file" # in this case delete lines with pattern
    touch -d "$t" "$file"
done
)

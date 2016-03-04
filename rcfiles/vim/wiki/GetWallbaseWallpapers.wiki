Arquivo: manual get wallpapers
Criado: Dom 29/Jul/2012 hs 03:13
Last Change: 2012 Jul 29 04:26:11
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
email: <voyeg3r  gmail.com>

wallbase.cc is an excellent site to download wallpapers with an option to
search through the wallpapers database which are tagged.  But with literally
a huge database it takes ages to download the wallpapers to browse and
download.  So if you are in a hurry just use the wallbase script to leech the
wallpapers of the site and then sort them at your leisure.

After get the script as seen below
wget -c https://raw.github.com/gist/1372927/ -O ~/mandatory-wallpaper.sh && chmod +x $_

Edit the script with your username and password
and possible level like NSFW

# no script para baixar papeis de parede do wallbase coloque o nome do usuário
sed -ri 's/(^USER=).*/\1"user"/g' ~/bin/wallbase.sh
sed -ri 's/(^PASS=).*/\1"password"/g' ~/bin/wallbase.sh
sed -ri 's/(^TYPE=).*/\15/g' ~/bin/wallbase.sh
# now use the command wallbase.sh
#
# the option TYPE allows you donwload your collection



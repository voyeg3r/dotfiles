# Arquivo: install vim
# Criado: Sex 16/Ago/2013 hs 10:53
# Last Change: 2013 Ago 16 10:59:30
# autor: Sérgio Luiz Araújo Silva
# site: vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# email: <voyeg3r  gmail.com>

# https://speakerdeck.com/mbrochh/vim-as-a-python-ide
#   on Ubuntu:
sudo apt-get install gtk2-engines-pixbuf

hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
[ -d ~/bin ] || mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
which vim
vim --version

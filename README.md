# README.md

``` markdown
File:		 README.md
Last Change: ter 10 jan 2017 15:09:50 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

``` markdown
License: MIT license
ermission is hereby granted, free of charge, to any person obtaining copy of
this software and associated documentation files (the Software"), to deal in
the Software without restriction, including ithout limitation the rights to
use, copy, modify, merge, publish, istribute, sublicense, and/or sell copies of
the Software, and to ermit persons to whom the Software is furnished to do so,
subject to he following conditions:

he above copyright notice and this permission notice shall be included n all
copies or substantial portions of the Software.

HE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS R
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF ERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  N NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY LAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, ORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE OFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```


```bash
clonedotfiles () {
# Arquivo: Arquivos de configuração de ambiente
# Criado: Dom 17/Out/2010 hs 15:13
# Last Change: sex 07 out 2016 08:58:58 BRT
# autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# http://www.twitter.com/voyeg3r

NEEDED_COMMANDS="git zsh"
for needed_command in $NEEDED_COMMANDS; do
    if ! hash "$needed_command" >/dev/null 2>&1; then
        printf "Command not found in PATH: %s\n" "$needed_command" >&2
        echo "instaling..."
        sudo pacman -S $needed_command
    fi
done

myclonefuntion(){
    ssh -T git@github.com
    var=`echo 3gmail.com@ | sed 's,\(^3\)\(gmail\.com\)\(\@\),voyeg\1r\3\2,g'`
    git config --global user.name voyeg3r
    git config --global merge.tool vimdiff
    # in the line below substitute ${var} by your e-mail
    git config --global user.email ${var}
    # add a last command, like this:
    git config --global alias.last 'log -1 HEAD'
    git config --global credential.helper cache
    git config --global push.default simple
    git config --global credential.helper 'cache --timeout=3600'
    git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
    git clone --depth 1 --jobs=4 --recursive  git@github.com:voyeg3r/dotfiles.git ~/.dotfiles
} && myclonefuntion

# Git Shallow clone:

    git clone --depth 1 --recursive https://github.com/voyeg3r/dotfiles ~/.dotfiles

    # to update all submodules
    git fetch --recurse-submodules --jobs=4


the recursive option allows us to clone also all submodules

# porwerline fonts

    git clone git@github.com:powerline/fonts.git

# how install fasd

    #git clone git://github.com/clvv/fasd.git && cd fasd ; sudo make install
    cd ~/.dotfiles/rcfiles/fasd && sudo make install

# config vundle
* https://github.com/VundleVim/Vundle.vim

    rm -rf ~/.dotfiles/vim/bundle/Vundle.vim

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim

    ln -sfvn ~/.dotfiles/rcfiles/vim/vimrc ~/.vimrc
    ln -sfvn ~/.dotfiles/rcfiles/vim ~/.vim
    ln -sfvn ~/.dotfiles/rcfiles/bashrc ~/.bashrc
    ln -sfvn ~/.dotfiles/rcfiles/inputrc ~/.inputrc
    ln -sfvn ~/.dotfiles/rcfiles/wgetrc ~/.wgetrc
    ln -sfvn ~/.dotfiles/gitconfig ~/.gitconfig
    ln -sfvn ~/.dotfiles/fonts.conf ~/.fonts.conf
    ln -sfvn ~/.dotfiles/pythonstartup ~/.pythonstartup
    ln -sfvn ~/.dotfiles/rcfiles/zsh/zshrc ~/.zshrc
    ln -sfvn ~/.dotfiles/rcfiles/zsh/zshenv ~/.zshenv
    ln -sfvn ~/.dotfiles/agignore ~/.agignore
    ln -sfvn ~/.dotfiles/rcfiles/conky/conkyrc ~/.conkyrc
    ln -sfvn ~/.dotfiles/rcfiles/yaourtrc ~/.yaourtrc
    [ ! -d ~/bin ] && ln -s ~/.dotfiles/bin ~/bin

    sudo chsh -s $(which zsh) $(whoami)


# installing fasdcd

    git clone git@github.com:clvv/fasd.git
    cd fasd && sudo make install

} && clonedotfiles
```

#### Manuais do git

	http://mariomoraesneto.blogspot.com.br/2012/11/git-dicas-basicas-e-praticas.html
	http://githowto.com/

#### listar configurações

	git config --list

#### Configurando git submodule

reference: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
http://gitref.org/
http://fadamiao.github.io/git-start/

``` sh
git submodule init
git submodule update

git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

## É possível configurar alias para os comandos, exemplos


dentro do seu repositório um arquivo .git/config
dentro dele cole estas linas.

```bash
[alias]
co = checkout
ci = commit
st = status
br = branch
hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
type = cat-file -t
dump = cat-file -p
```

#### Como adicionar sua chave ssh ao github


	https://help.github.com/articles/generating-ssh-keys

####  começando um novo projeto

```sh
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:voyeg3r/dotfiles.git
git push -u origin master
```

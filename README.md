# Arquivo: Arquivos de configuração de ambiente
Criado: Dom 17/Out/2010 hs 15:13
Last Change: Sat May 02, 2015  10:18AM
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
http://www.twitter.com/voyeg3r

# voyeg3r dotfiles --> https://github.com/voyeg3r/dotfiles

```start clonedotfiles
clonedotfiles () {
ssh -T git@github.com

var=`echo 3gmail.com@ | sed 's,\(^3\)\(gmail\.com\)\(\@\),voyeg\1r\3\2,g'`
git config --global user.name voyeg3r

# in the line below substitute ${var} by your e-mail
git config --global user.email ${var}

git config --global credential.helper cache
git config --global push.default simple
git config --global credential.helper 'cache --timeout=3600'
git clone git@github.com:voyeg3r/dotfiles.git ~/.dotfiles

git clone git@github.com:voyeg3r/dotfiles.git ~/.dotfiles

ln -sfvn ~/.dotfiles/vim/vimrc ~/.vimrc
ln -sfvn ~/.dotfiles/vim ~/.vim
ln -sfvn ~/.dotfiles/bashrc ~/.bashrc
ln -sfvn ~/.dotfiles/inputrc ~/.inputrc
ln -sfvn ~/.dotfiles/gitconfig ~/.gitconfig
ln -sfvn ~/.dotfiles/fonts.conf ~/.fonts.conf
ln -sfvn ~/.dotfiles/pythonstartup ~/.pythonstartup
ln -sfvn ~/.dotfiles/zshrc ~/.zshrc
ln -sfvn ~/.dotfiles/agignore ~/.agignore
[ ! -d ~/bin ] && ln -s ~/.dotfiles/bin ~/bin

} && clonedotfiles
```end dotfiles

## Manuais do git

	http://mariomoraesneto.blogspot.com.br/2012/11/git-dicas-basicas-e-praticas.html
	http://githowto.com/

## listar configurações

	git config --list

## Configurando git submodule

reference: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
http://gitref.org/
http://fadamiao.github.io/git-start/

    git submodule init
    git submodule update

	git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
	git add .
	git commit -m "Install Fugitive.vim bundle as a submodule."

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

## Como adicionar sua chave ssh ao github


	https://help.github.com/articles/generating-ssh-keys

##  começando um novo projeto

```bash
	touch README.md
	git init
	git add README.md
	git commit -m "first commit"
	git remote add origin git@github.com:voyeg3r/dotfiles.git
	git push -u origin master
```

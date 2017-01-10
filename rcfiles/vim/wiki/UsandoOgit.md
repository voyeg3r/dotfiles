# [[Dicas]] do comando git
https://githowto.com/getting_old_versions

``` markdown
File:		 UsandoOgit.md
Created:	 ter 10 jan 2017 14:37:28 BRT
Last Change: ter 10 jan 2017 14:40:44 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

#### Atualizar um repositório local puxando do servidor

     git pull origin master

#### Clonar um repositório num momento específico
http://stackoverflow.com/questions/3489173/

   git clone $URL
   git reset --hard $SHA1

   to revert a change in a single file do this:

    git co filename

    No vim faça:

    :Git checkout %

#### add current file to git

     :Git add %

#### Para clonar este repositorio faça

	git clone git@github.com:voyeg3r/dotfiles.git ~/.vim


	Para usar o vimdiff

      git config --global merge.tool vimdiff

#### Manuais do git

	http://mariomoraesneto.blogspot.com.br/2012/11/git-dicas-basicas-e-praticas.html
	http://githowto.com/

#### Configurando o usuário

	git config --global user.name "seu nome"
	git config --global user.email "seu@email.com"

#### listar configurações

	git config --list

#### É possível configurar alias para os comandos, exemplos

dentro do seu repositório um arquivo .git/config
dentro dele cole estas linas.

	[alias]
	co = checkout
	ci = commit
	st = status
	br = branch
	hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
	type = cat-file -t
	dump = cat-file -p

#### Como adicionar sua chave ssh ao github

	https://help.github.com/articles/generating-ssh-keys

#### começando um novo projeto

	touch README.md
	git init
	git add README.md
	git commit -m "first commit"
	git remote add origin git@github.com:voyeg3r/dotfiles.git
	git push -u origin master

#### Git - easy way pull latest of all submodules

    git submodule foreach git pull

#### how checkout from a particular revison point

		Git clone particular version of remote repository

		git clone [remote_address_here] my_repo
		cd my_repo
		git reset --hard [ENTER HERE THE COMMIT HASH YOU WANT]


#### Atualizando um repositório clonado

    git remote update

#### Como checar as alterações de um único arquivo

    git log --follow filename


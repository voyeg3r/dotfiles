# Como usar o vimwiki de forma mais efeitiva

```
File:		 Wiki.md
Created:	 ter 10 jan 2017 12:30:04 BRT
Last Change: ter 10 jan 2017 12:31:12 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

[vimwiki website](https://github.com/vimwiki/vimwiki)

* leader>ww ..................... wiki index
* leader>wi ..................... abre o diário
* Leader>wd ..................... Delete wiki page you are in.
* Leader>wr ..................... Rename wiki page you are in.
* map == <Plug>VimwikiAddHeaderLevel
* <c-space> toggle checkbox in a list
* gl remove checkbox gL

    if you press + vimwiki will create a link

    :VimwikiTable cols rows
    Create a table with the given cols and rows


# No vimrc alterei a syntaxe do vimwiki para markdown

    let g:vimwiki_list = [{'path': '~/.dotfiles/rcfiles/vim/wiki',
                     \ 'index': 'main', 'syntax': 'markdown', 'ext': '.md'}]

# Para renomear todos os arquivos usei o perl-rename dessa forma:

    perl-rename 's/\.wiki/.md/g' *.wiki


# alterando a sintaxe dos títulos no vimwiki

    command! -nargs=0 Chead2 :.s/^==\([^=].*\)==/## \1/g
    command! -nargs=0 Chead1 :.s/^=\([^=].*\)=/# \1/g

    nmap ,2 :%s/^==\([^=].*\)==/##\1/g
    nmap ,1 :%s/^=\([^=].*\)=/#\1/g

    :%s/^==\([^=].*\)==/##\1/g

### mapeamento para mudar os links para a notação markdown

     Os links do vimwiki são assim [[Wiki.md|Wiki]]
     mas esse formato não é bem interpretado pelo github
     e portante a notação --> [Wiki](Main.md)
     será usada:

     o comando abaixo faz isso na linha corrente

    .s/\[\[\([^]]*\)\]\]/[\1](\1.md)/g

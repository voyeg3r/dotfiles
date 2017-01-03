# Como usar o vimwiki de forma mais efeitiva

    leader>ww ..................... wiki index
    leader>wi ..................... abre o diário
    Leader>wd              Delete wiki page you are in.
    Leader>wr              Rename wiki page you are in.
    map == <Plug>VimwikiAddHeaderLevel

    :VimwikiTable cols rows
    Create a table with the given cols and rows


# No vimrc alterei a syntaxe do vimwiki para markdown

    let g:vimwiki_list = [{'path': '~/.dotfiles/rcfiles/vim/wiki',
                     \ 'index': 'main', 'syntax': 'markdown', 'ext': '.md'}]

# Para renomear todos os arquivos usei o perl-rename dessa forma:

    perl-rename 's/\.wiki/.md/g' *.wiki




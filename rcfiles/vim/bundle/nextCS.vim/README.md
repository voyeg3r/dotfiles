nextCS.vim
------

[nextCS.vim](https://github.com/chilicuil/nextCS.vim) let you change your vim theme in one shot.

- F12 Next
- F11 Previous

<p align="center">
<img src="http://javier.io/assets/img/nextCS.gif" alt="nextCS"/>
</p>

Simple enough :)

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your `$HOME/.vimrc` file:

        Bundle 'chilicuil/nextCS.vim'

    And run inside of vim:

        :BundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/chilicuil/nextCS.vim.git ~/.vim/bundle/nextCS.vim

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to $HOME/.vim

        mv nextCS.vim*.zip $HOME/.vim
        cd $HOME/.vim && unzip nextCS.vim*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

If you find yourself uncomfortable with the default mapping, change it by adding to your vimrc file:

    let g:nextcs_map = '<F12>'
    let g:nextcs_map = '<F11>'

Or by modifing directly the <Plug> actions

    map <F12> <Plug>NextCS
    map <F11> <Plug>PreviousCS

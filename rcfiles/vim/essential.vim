" Source; Book Practical Vim
" https://pragprog.com/book/dnvim2/practical-vim-second-edition
"
" Use Vim’s Factory Settings
" Vim is highly configurable. If you don’t like the defaults, then you can change
" them. That’s a good thing, but it could cause confusion if you follow the
" examples in this book using a customized version of Vim. You may find that
" some things don’t work for you the way that they are described in the text.
" If you suspect that your customizations are causing interference, here’s a
" quick test. Try quitting Vim and then launching it with these options:
"
" vim -u NONE -N
"
" The -u NONE flag tells Vim not to source your vimrc on startup. That way, your
" customizations won’t be applied and plugins will be disabled. When Vim starts
" up without loading a vimrc file, it reverts to vi compatible mode, which causes
" many useful features to be disabled. The -N flag prevents this by setting the
" ‘nocompatible’ option.
" For most examples in Practical Vim, the vim -u NONE -N trick should guarantee
" that you get the same experience as described, but there are a couple of
" exceptions. Some of Vim’s built-in features are implemented with Vim script,
" which means that they will only work when plugins are enabled. This file
" contains the absolute minimum configuration that is required to activate
" Vim’s built-in plugins:
" essential.vim
"
" set nocompatible
" filetype plugin on
"
"
" When launching Vim, you can use this file instead of your vimrc by running
" the following:
" ➾
" $ vim -u code/essential.vim

set nocompatible
filetype plugin on


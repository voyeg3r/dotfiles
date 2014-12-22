nextCS
------

nextCS (next Color Scheme) changes your theme in one shot. It's based on some other scripts I found who didn't work with some silly color schemes. This one will load *every* theme you have. If it's incorrect, you'll see the error, but you'll able to just press "next" (F12) and see the next.

- F12 Next
- F11 Previous

<p align="center">
<img src="http://javier.io/assets/img/nextCS.gif" alt="nextCS"/>
</p>

Simple enough :)

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your $HOME/.vimrc file:

        Bundle 'chilicuil/nextCS'

    And run inside of vim:

        :BundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/chilicuil/nextCS.git ~/.vim/bundle/nextCS

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to $HOME/.vim

        mv nextCS*.zip $HOME/.vim
        cd $HOME/.vim && unzip nextCS*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

If you find yourself uncomfortable with the default mapping, change it by adding to your vimrc file:

    let g:nextcs_map = '<F12>'
    let g:nextcs_map = '<F11>'

License
-------

© 2014 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/

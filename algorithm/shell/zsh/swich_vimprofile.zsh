#!/usr/bin/env zsh
#    Filename: swich nvim profile
#     Created: seg 22 abr 2019 10:29:01 -03
# Last Change: abr 22 2019 20:35
#     Purpose: swich nvim profiles through symlinks
#      Author: Sergio Araujo
#     Twitter: @voyeg3r
#     Licence: GPL (see http://www.gnu.org/licenses/gpl.txt)
#  References: https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/

# set the alternate profile here
alt_profile="$HOME/tmp/nvim"
default_profile="$HOME/.dotfiles/nvim"

# nesta seção criamos o diretório de configuração
# contendo o arquivo init.vim
if [[ ! -d $alt_profile ]]; then
mkdir -p $alt_profile
cat <<EOF > ${alt_profile}/init.vim
" file: init.vim

if has("nvim")
    set inccommand=nosplit
    tnoremap <Esc> <c-\><c-n>
endif

set nu
let mapleader = ","
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Space> /

call plug#begin('~/tmp/nvim/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
call plug#end()

" snippets
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<C-Space>"
let g:UltiSnipsUsePythonVersion = 3

EOF
fi

# instala o vim plug
if [[ ! -e "${alt_profile}/autoload/plug.vim" ]]; then
    curl -fLo ${alt_profile}/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

current_link=$(ls -l ~/.config | awk '($10 ~ /->/ && $9 ~ /nvim/ ) {print $11}')

if [[ "$current_link" == "$alt_profile"  ]]; then
    ln -sfvn $default_profile $HOME/.config/nvim  2>&1 > /dev/null
else
    ln -sfvn $alt_profile $HOME/.config/nvim  2>&1 > /dev/null
fi

echo
echo "Nvim profile changed to:"
ls -l ~/.config | awk '($10 ~ /->/ && $9 ~ /nvim/ ) {print $11}'
echo

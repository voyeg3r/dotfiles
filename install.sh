#!/usr/bin/env bash
#     Filename:
#      Created: ago 31, 2021 - 10:53
#  Last Change: Fri, 17 May 2024 - 05:36:50
#          vim: ft=sh:fdm=syntax:nu:
#  Instituicao: install my repo
# This aims to: clone my repo
#        Autor: Sergio Araujo
#         site: https://dev.to/voyeg3r
#       github: @voyeg3r
#       e-mail: <voyeg3r ✉ gmail.com>
#      Licence: GPL (see http://www.gnu.org/licenses/gpl.txt)

# IF YOUR DO NOT HAVE PERMISSION TO CLONE TRY THE HTTP VERSION

cd

# it fits my needss but you can addpat it
setrepo(){

  git clone --recursive -j8 git@bitbucket.org:sergio/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles && git fetch --recurse-submodules --jobs=8
  ssh -T git@github.com
  var=`echo 3gmail.com@ | sed 's,\(^3\)\(gmail\.com\)\(\@\),voyeg\1r\3\2,g'`
  git config --global user.name voyeg3r
  git config --global merge.tool vimdiff
  git config --global user.email ${var}
  git config --global alias.last 'log -1 HEAD'
  git config --global credential.helper cache ssh://git@bitbucket.org/sergio/dotfaster.git/wiki
  git config --global push.default simple
  git config --global credential.helper 'cache --timeout=3600'
  git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
  git config --global core.autocrlf input
  git config --global core.eol lf
  git config --global core.pager less -FRSX
  git config --global init.defaultbranch main
  git config --global color.branch auto
  git config --global color.diff auto
  git config --global color.interactive auto
  git config --global color.status auto
  git config --global color.ui auto

  # ln -sfvn ~/.dotfiles/nvim ~/.config/
  if [[ $(uname -o) == "Android" ]]; then
    ln -sfvn ~/.dotfiles/termux/zsh/.zshenv ~/.zshenv
    ln -sfvn ~/.dotfiles/termux/zsh/.zshrc ~/.zshrc
  else
    ln -sfvn ~/.dotfiles/zsh/.zshenv ~/.zshenv
    ln -sfvn ~/.dotfiles/zsh/.zshrc ~/.zshrc
  fi

  ln -sfvn ~/.dotfiles/bashrc ~/.bashrc
  ln -sfvn ~/.dotfiles/inputrc ~/.inputrc
  ln -sfvn ~/.dotfiles/xinitrc ~/.xinitrc
  ln -sfvn ~/.dotfiles/rofi ~/.config
  ln -sfvn ~/.dotfiles/polybar ~/.config
  ln -sfvn ~/.dotfiles/bspwm ~/.config
  ln -sfvn ~/.dotfiles/sxhkd ~/.config
  ln -sfvn ~/.dotfiles/Xresources ~/.Xresources
  ln -sfvn ~/.dotfiles/detox/detoxrc ~/.detoxrc
  ln -sfvn /home/sergio/.dotfiles/mpv/mpv.conf ~/.config/mpv/mpv.conf
  ln -sf ~/.dotfiles/dunst ~/.config/dunst
  ln -sfvn ~/.dotfiles/inkscape ~/.config/inkscape/templates
  ln -sfvn ~/.dotfiles/agignore ~/.agignore
  ln -sfvn ~/.dotfiles/agignore ~/.ignore  # see aliases --path-to-ignore
  ln -sfvn ~/.dotfiles/gemrc ~/.gemrc
  ln -sfvn ~/.dotfiles/curl/curlrc ~/.curlrc
  ln -sfvn ~/.dotfiles/fontconfig ~/.config/fontconfig
  ln -sfvn ~/.dotfiles/bcrc ~/.config/brcr
  ln -sfvn ~/.dotfiles/aria2 ~/.config/aria2
  ln -sfvn ~/.dotfiles/kitty ~/.config/kitty
  ln -sfvn ~/.dotfiles/newsboat ~/.config
  ln -sfvn ~/.dotfiles/hidden ~/.hidden
  ln -sfvn ~/.dotfiles/sxiv ~/.config

  [[ ! -d ~/.zsh/cache ]] && mkdir -p ~/.zsh/cache

  [[ ! -d ~/.fonts ]] && {
    unzip ~/.dotfiles/fonts.zip -d ~/.fonts
      fc-cache -fv
    }

   # setting up our DWM autostart
   [ ! -f "$XDG_DATA_HOME/dwm/autostart.sh" ] && (
   mkdir "$XDG_DATA_HOME/dwm"
   ln -sfvn $HOME/.dotfiles/dwm/autostart.sh "$XDG_DATA_HOME/dwm/autostart.sh"
 )

} && setrepo

---
Filename: /home/sergio/.dotfiles/README.md
Last Change: Fri, May 2024/05/31 - 13:32:21
# vim:cole=0:nolist:nospell:ft=markdown:expandtab:tabstop=2:shiftwidth=2:
---

## Install this repo

    git clone https://sergio@bitbucket.org/sergio/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles && git fetch --recurse-submodules --jobs=8

```sh
clonerepo(){
    # NOTE: in my case I have the ssh keys (my personal settings)
    git clone git@bitbucket.org:sergio/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles && git fetch --recurse-submodules --jobs=8

    ssh -T git@bitbucket.org
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

    ln -sfvn ~/.dotfiles/zsh ~/.config/
    ln -sfvn ~/.dotfiles/zsh/zshenv ~/.zshenv
    ln -sfvn ~/.dotfiles/bash/bashrc ~/.bashrc
    ln -sfvn ~/.dotfiles/bash/inputrc ~/.inputrc
    ln -sfvn ~/.dotfiles/bash/bash_profile ~/.bash_profile
    ln -sfvn ~/.dotfiles/xinitrc ~/.xinitrc
    ln -sfvn ~/.dotfiles/rofi ~/.config
    ln -sfvn ~/.dotfiles/polybar ~/.config
    ln -sfvn ~/.dotfiles/bspwm ~/.config
    ln -sfvn ~/.dotfiles/sxhkd ~/.config
    ln -sfvn ~/.dotfiles/Xresources ~/.Xresources
    ln -sfvn ~/.dotfiles/detox/detoxrc ~/.detoxrc
    ln -sfvn /home/sergio/.dotfiles/mpv/mpv.conf ~/.config/mpv/mpv.conf
    ln -sfvn ~/.dotfiles/agignore ~/.agignore
    ln -sfvn ~/.dotfiles/ignore ~/.ignore
    ln -sfvn ~/.dotfiles/gemrc ~/.gemrc
    ln -sfvn ~/.dotfiles/curl/curlrc ~/.curlrc
    ln -sfvn ~/.dotfiles/fontconfig ~/.config/fontconfig
    ln -sfvn ~/.dotfiles/bcrc ~/.config/bcrc
    ln -sfvn ~/.dotfiles/aria2 ~/.config/aria2
    [ -d ~/.config/youtube-dl ] || mkdir -p ~/.config/youtube-dl
    ln -svfn ~/.dotfiles/youtube-dl.config ~/.config/youtube-dl/config
    ln -sfvn ~/.dotfiles/yt-dlp ~/.config
    ln -sfvn ~/.dotfiles/backgrounds $"{XDG_PICTURES_DIR:-~/img}"/backgrounds
    ln -sfvn ~/.dotfiles/awesome ~/.config
    ln -sfvn ~/.dotfiles/hidden ~/.hidden
    ln -sfvn ~/.dotfiles/elinks ~/.config
    ln -sfvn ~/.dotfiles/profile ~/.profile
    ln -sfvn ~/.dotfiles/asound.state ~/.config/asound.state
    ln -sfvn ~/.dotfiles/inkscape/templates ~/.config/inkscape/templaates
    ln -sfvn ~/.dotfiles/dradio ~/.config
    ln -sfvn ~/.dotfiles/sxiv ~/.config
    ln -sfvn ~/.dotfiles/zsh ~/.config

    [[ ! -d ~/.fonts ]] && {
      unzip ~/.dotfiles/fonts.zip -d ~/.fonts
      fc-cache -fv
    }

    [[  ! -d "$XDG_CONFIG_HOME/luacheck/"  ]] && {
      ln -sfvn ~/.dotfiles/luacheck "$XDG_CONFIG_HOME"
    }

  # test if we are on Android
  if [[ $(uname -o) == "Android" ]]; then
    if [[ $(readlink ~/.termux) != "$HOME/.dotfiles/termux" ]]; then
      ln -sfvn ~/.dotfiles/termux ~/.termux
    fi
  fi

   # setting up our DWM autostart
   [ ! -f "$XDG_DATA_HOME/dwm/autostart.sh" ] && (
    mkdir "$XDG_DATA_HOME/dwm"
    ln -sfvn $HOME/.dotfiles/dwm/autostart.sh "$XDG_DATA_HOME/dwm/autostart.sh"
   )

} && clonerepo
```

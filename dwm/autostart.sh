#!/usr/bin/env bash
# Filename: autostart.sh
# Last Change: Sun, 15 Oct 2023 - 05:43:19
# vim:nolist softtabstop=4 shiftwidth=4 tabstop=4 expandtab ft=sh:
#
# NOTE: the file must have the extension .sh

# If you are using this build it already has the autostart
# patch applyied, just create a folder ~/.dwm and put this
# file in there or use $XDG_DATA_HOME/dwm as seen bellow
# NOTE: The autostart file needs the extension "sh"
#
#  [ ! -f "$XDG_DATA_HOME/dwm/autostart.sh" ] && (
#   mkdir "$XDG_DATA_HOME/dwm"
#   ln -sfvn $HOME/.dotfiles/dwm/autostart.sh "$XDG_DATA_HOME/dwm/autostart.sh
#  )

export DISPLAY=:0

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

export $(dbus-launch)

#xautolock -time 10 -locker slock -nowlocker slock -detectsleep -corners ++-- -cornerdelay 3 &
pgrep -x xautolock >/dev/null ||  (xautolock -time 5 -locker slock -nowlocker slock -detectsleep -corners -+-- -cornerdelay 3 -notify 5 -notifier "/home/sergio/.dotfiles/bin/lockscreen-notify.sh") &

#/bin/picom -b --config ~/.config/picom/picom.conf &
#/usr/bin/picom -b --config ~/.dotfiles/picom/picom.conf &

##  installed in artix with -> yay -S picom-allusive
/usr/local/bin/picom --backend glx &

wal -qi ~/.dotfiles/backgrounds &
#feh -z --bg-fill ~/.dotfiles/backgrounds
# numlockx on &

# [[ -f /usr/libexec/xfce-polkit ]] && doas /usr/libexec/xfce-polkit & echo $! > /tmp/polkit-pid

## Disable touchpad while typing (voidlinux)
# doas cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
# libinput xorg-xinput on archlinux or artixlinux
# syndaemon -i .8 -K -t -R -d &

# 300 ms delay 50 chars per second
xset r rate 300 50 &

# disable screensaver
xset s off &

# siable power options (artix xorg-xset)
xset -dpms &

## command -v xcalib >/dev/null && (
##     [ -d "~/color/icc" ] && xcalib -v ~/.color/icc/CoatedFOGRA39.icc &
## )

pgrep -u $UID -nf clipmenud || clipmenud &

dunst ~/.config/dunst/dunstrc &

# alsactl --file ~/.config/asound.state restore &

export NO_AT_BRIDGE=1
pgrep -x udiskie >/dev/null || exec udiskie &
# udiskie is an automounter for removable media

redshift -x && redshift &

eval $(ssh-agent) &

exec ~/.dotfiles/dwm/slstatus/slstatus &

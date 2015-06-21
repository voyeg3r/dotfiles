#!/usr/bin/env bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2012 Dez 29 10:25:13
# THIS SCRIPT AIMS: describe here
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

# source: http://www.howtogeek.com/118817/how-to-swap-the-two-and-three-finger-touchpad-tap-actions-on-ubuntu/

# gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "~/bin/touchpad.sh"

synclient TapButton2=2
synclient TapButton3=3

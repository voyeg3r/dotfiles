# source:http://www.howtogeek.com/118817/how-to-swap-the-two-and-three-finger-touchpad-tap-actions-on-ubuntu/

# on terminal do this:
# synclient TapButton2=2 && synclient TapButton3=3

# -----------------8<------------------------------------------
# via script do this
# gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/name/touchpad.sh"

# inside the script put this
# -----------------8<-------------------------------------------

synclient TapButton2=2
synclient TapButton3=3

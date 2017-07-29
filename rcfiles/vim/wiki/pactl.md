# pactl - - Control a running PulseAudio sound server
+ http://blog.chapagain.com.np/ubuntu-linux-increase-decrease-volume-from-command-line-keyboard-shortcut/

You can also control volume using [amixer](amixer.md)

### Increase volume by 10%

    pactl -- set-sink-volume 0 +10%

### Decrease volume by 10%

    pactl -- set-sink-volume 0 -10%

### Set volume to 80%

    pactl -- set-sink-volume 0 80%

### Set volume to 200%

    pactl -- set-sink-volume 0 200%

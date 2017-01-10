
# converter wav para mp3
lame -V2 rec01.wav rec01.mp3

### converter mp4 para mp3

faad -o - "$i" | lame -h -b 192 - "${i%m4a}mp3"


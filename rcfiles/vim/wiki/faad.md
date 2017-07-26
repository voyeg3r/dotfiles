# intro
+ http://www.bashoneliners.com/oneliners/oneliner/111/

    Process an Advanced Audio Codec stream

###  Convert m4a files to mp3 using faad and lame

     faad -o tmp.wav music.m4a && lame -b 192 tmp.wav music.mp3

### On zsh do this:
OBS: I had to use "detox" before

    for f in `ls *.m4a`; do
        faad -o tmp.wav "$f" && lame -b 192 tmp.wav "${f%.m4a}.mp3"
    done

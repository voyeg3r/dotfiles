### Afinando o violão pelo bash


for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done

# só o mi
    play -n synth 4 pluck E4 repeat 2


### emitir um som simples (cancela com ctrl-c)

    play -n synth sine 220

### Normalising audio with sox
https://www.learnosity.com/blog/2009/11/normalising-audio-with-sox/

    sox before.wav -n stat -v

This will return a number like: 4.234

You can then call sox again using this number:

    sox -v 4.234 before.wav after.wav

And if you're feeling particularly good you can put the whole command on a single line as follows:

    sox -v `sox before.wav -n stat -v 2>&1` before.wav after.wav


### Puting away mosquitos with play
+ https://stackoverflow.com/a/24241901/2571881

There is a lot dicussin conerning if these sounds can actually
put away mosquitos

    play -n -c1 synth 3 sine 24000



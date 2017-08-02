# intro
  a media player

### watch youtube videos throught mpv

    mpv --ytdl url

### função ouvir o audio de um video do youtube

    function mm() {
        mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"$@"
    }


a opção `--no-video` é auto explicativa e a opção `--ytdl` é um acrônimo
que faz referência ao youtube-dl

   ``` sh
   mpv --no-video --ytdl https://www.youtube.com/watch\?v\=IpQk8qByP_4
   ```
### help system

    mpv --help

### In order to be able to play DVD with mpv

    mpv dvd://


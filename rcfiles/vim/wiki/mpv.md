# intro
  a media player

### watch youtube videos throught mpv

    mpv --ytdl url

    by default mpv cli user this option

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

### Extract audio

    mpv videofile.avi -o audiofile.mp3 --no-video

    # Extract audio from video file at a specific time.
    mpv videofile.avi -o audiofileAtSpecificTime.mp3 --no-video --start=00:01:00 --end=00:03:35

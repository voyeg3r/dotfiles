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


### How to watch a live stream from the beginning in mpv
+ https://haasn.xyz/posts/2016-11-04-how-to-watch-a-live-stream-from-the-beginning-in-mpv.html

by Niklas Haas on November 4, 2016

Tagged as: mpv, tips.

If you try watching a video recording on twitch etc. while it’s still ‘live’,
mpv/youtube-dl will play the live video instead of starting from the beginning.

The fix is straightforward: By appending `?t=0m` you can force it to start at the beginning:

	mpv 'https://www.twitch.tv/example/v/12345?t=0'

This is also useful for a second purpose: seeking. Normally, by trying to seek
a live stream like this in mpv you will end up buffering and downloading
forever. (I’m not exactly sure what’s going on since the mpv cache is so
opaque, but I have to imagine it’s actually trying to download all the data you
skipped past)

By changing it to e.g. `?t=20m` you can seek to 20 minutes in the stream.


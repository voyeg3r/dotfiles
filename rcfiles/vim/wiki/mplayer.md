### Extrair audio de avi, flv, mpeg, etc...

    mplayer -dumpaudio NOMEDOVIDEO.avi -dumpfile NOMEDOVIDEO.mp3

### Assistir online stream e gravar ao mesmo tempo
+ https://shkspr.mobi/blog/2011/11/watching-and-simultaneously-saving-video-in-mplayer/

    wget -O - http://site.com/video.avi | tee -ai cameravideo.avi | mplayer -cache 8192 -cache-min 1

### Extrair audio de dvd
Abra um terminal e digite

    mkfifo
    mplayer dvd://1 -chapter 1-1 -aid 128 -ao pcm:file= -vc dummy -vo null

Abra outro terminal no mesmo diretório e digite

    lame -b 192 --resample 44100 -o titulo-1.mp3

### converter video flv para gif animado

    mplayer -vo gif89a yourvideosfilename.flv

# some radios
KCRW: http://www.kcrw.com/pls/kcrwsimulcast.pls
KSLU: http://147.174.55.20:8000/listen.pls
WEMU: http://www.wemu.org/WEMU-broadband.m3u
WESU: http://radio.wesleyan.edu:8000/listen.pls
WUGA: http://www.wuga.org/wuga-hi.pls


mplayer -playlist  http://www.kcrw.com/pls/kcrwsimulcast.pls
mplayer -playlist  http://147.174.55.20:8000/listen.pls
mplayer -playlist  http://www.wemu.org/WEMU-broadband.m3u
mplayer -playlist  http://radio.wesleyan.edu:8000/listen.pls
mplayer -playlist  http://www.wuga.org/wuga-hi.pls

###  HOW RECORD A ONLINE STREAM RADIO?

 in this case wnyc - HERE you are dumping the file to your machine
 and at same time you cand hear using vlc
mplayer -playlist "http://www.wnyc.org/stream/wnyc-fm939/mp3.pls" -dumpstream -dumpfile test.mp3

alias news="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls" # MPR News
alias current="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/the_current.pls" # The Current
alias classical="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls" # Classical MPR
alias localcurrent="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/local.pls" # Local Current
alias heartland="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/radio_heartland.pls" # MPR Radio Heartland
alias wonderground="mplayer http://wondergroundstream2.publicradio.org/wonderground" # MPR Wonderground Windows Media
alias choral="mplayer -playlist http://choralstream1.publicradio.org/choral.m3u" # Clasical MPR Choral
alias wefunk="mplayer -playlist http://www.wefunkradio.com/play/shoutcast.pls" # WEFUNK Radio MP3 64K
alias sleepbot="mplayer -playlist http://sleepbot.com/ambience/cgi/listen.cgi/listen.pls" # Sleepbot Environmental Broadcast 56K MP3
alias groovesalad="mplayer -playlist http://somafm.com/groovesalad130.pls" # Soma FM Groove Salad iTunes AAC 128K
alias dronezone="mplayer -playlist http://somafm.com/dronezone130.pls" # Soma FM Drone Zone iTunes AAC 128K
alias lush="mplayer -playlist http://somafm.com/lush130.pls" # Soma FM Lush iTunes AAC 128K
alias sonicuniverse="mplayer -playlist http://somafm.com/sonicuniverse.pls" # Soma FM Sonic Universe iTunes AAC 128K

### play a movie or song slower

    mplayer -af scaletempo -speed .7 filename

### Referências
* http://ubuntudicas.blogspot.com/2008/11/extraindo-udio-de-vdeos-avi-flv-mpeg.html
* http://ubuntuforum-pt.org/index.php/topic,42984.0/topicseen.html

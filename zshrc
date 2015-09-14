# Path to your oh-my-zsh installation.
export ZSH=/home/sergio/.dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

setopt PROMPT_BANG # enables '!' substituition on prompt

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fasd extract)

# testing completions
# https://github.com/zsh-users/zsh-completions
plugins+=(zsh-completions)
autoload -U compinit && compinit
autoload -Uz url-quote-magic; zle -N self-insert url-quote-magic

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"
#
cdpath=(. .. ~/Desktop ~/bin ~/docs ~/docs/img ~/tmp)
path=(~/bin $path)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Listen to Air Traffic Control, used to be scripts.
alias GIG='mplayer http://rio.radioetvweb.com.br:8246'
alias GRU='mplayer http://rio.radioetvweb.com.br:8298'
alias POA='mplayer http://rio.radioetvweb.com.br:8282'
alias CGH='mplayer http://rio.radioetvweb.com.br:8300'
alias classic='mplayer http://80.237.154.83:8120'
# watch aljazeera
alias alj='rtmpdump -v -r "rtmp://aljazeeraflashlivefs.fplive.net/aljazeeraflashlive-live/aljazeera_eng_med" | mplayer -'

alias myexternalip='curl http://myexternalip.com/raw'
alias iso2utf='iconv -f iso-8859-1 -t utf-8'
alias utf2iso='iconv -f utf-8 -t iso-8859-1'

########### aliases #################
# aliases para fasd
alias a='fasd -a' # any
alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias vf='vim $(fasd -f)'
alias sd='fasd -sid' # interactive directory selection
alias sf='fasd -sif' # interactive file selection
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim' # open file with vim
alias v='f -t -e vim -b viminfo'
alias o='a -e xdg-open' # quick opening files with xdg-open
alias _!='fc -e "sed -i -e \"s/^/sudo /\""' # sudo last command


alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# este alias é para editar no audacity um audio selecionado
# dentro do anki
alias EW='z collect && audacity `xclip -selection clipboard -o`'

alias lad='ls -d -- .*(/)'				# only show dot-directories
alias lsa='ls -a -- .*(.)'				# only show dot-files
alias lsd='ls -d -- *(/)'				  # only show directories
alias -s txt=vim
alias -s text=vim
alias gril='grep -irl'
alias -g CB='| xclip -selection c'
alias -g C='| wc -l'
alias -g L='| less -r'
alias -g T='| tail'
alias -g H='| head'
alias -g G='| grep -i'
alias -g V='| gvim -'
alias -g X='| xargs'
alias -g N='*/**(.om[1])'
alias -g ND='./**/*(/om[1])' # newest directory
alias -g NF='./**/*(.om[1])' # newest file
alias -g latest='./**/*(.om[1])' # newest file | also Ctrl-x Ctrl-m
alias -g NUL="> /dev/null 2>&1"
alias -g DN="> /dev/null 2>&1"
alias -g LC='| tr A-Z a-z'
alias -g UL="| sed 's, ,_,g'"
alias -g ULC="| tr A-Z a-z | sed 's, ,_,g'"
alias pnf='mpg123 ./**/*(.om[1])'
alias install='sudo apt-fast -y install'
mktbz () { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/";}
groove-dl-cli(){ python2.7 /usr/share/groove-dl/groove.py "$@" ;}
man2pdf () { man -w $1 && man -t $1 | ps2pdf - $1.pdf; }
alias ping='ping -n -c 4 -i 0.2 -W1'
alias shell='echo ${SHELL:t}'
alias lvim="vim -c \"normal '0\""
alias vnew='cd && vim */**(.om[1])'
alias ls='ls --color'
alias path="echo ${PATH//:/$'\n'}"
alias ssh='ssh -C'
alias scp='scp -r'
alias less='less -r'
alias compilalivro='make clean; make && make show'
alias 4shared='cadaver http://webdav.4shared.com/'
alias yd='youtube-dl --write-auto-sub `xclip -o`'
########### end aliases #################

# functions
yt () mplayer -fs -quiet $(youtube-dl -g "$1")
gsend() { git commit -am "$1" && git push ;}
lowerstring() { echo "${*}" | awk '{print tolower($0)}' ;}
lower (){ echo ${@:l} }  # this versio only works in zsh
upper (){ echo ${@:u} }  # this versio only works in zsh
expandurl() { curl -sIL $1 | awk '/^Location/ || /^Localização/ {print $2}' ; }
calc(){ echo "scale=2;$@" | bc;}
alias calc='noglob calc'
ff () { find . -type f -iname '*'"$@"'*' ; }
mkcd() { mkdir -p "$@" && cd $_; }
decToBin () { echo "ibase=10; obase=2; $1" | bc; }
decTohex () { bc <<< "obase=16; $1"; }
biggest (){ du -k * | sort -nr | cut -f2 | head -20 | xargs -d "\n" du -sh; }
top10 () { history | awk '{print $2}' | sort | uniq -c | sort -rn | head ; }
beep () { echo -e -n \\a ; }
dict() { curl "dict://dict.org/d:${1%%/}";}
cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; }

youtube-mp3 () {
    # get mp3 from youtube
    command -v ffmpeg >/dev/null && youtube-dl --restrict-filenames --extract-audio --audio-format=mp3 --audio-quality 320k "${1}"
    [[ $? = 1 ]] && echo "instale o programa ffmpeg para poder converter para mp3"
}

insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# use magic-space
bindkey ' ' magic-space

# some radios using mplayer
alias bbc="mplayer -playlist http://peace.str3am.com:6810/live-96k.mp3.m3u"
alias wnyc="mplayer -playlist http://www.wnyc.org/stream/wnyc-fm939/mp3.pls"
alias wfiu="mplayer -playlist http://hannibal.ucs.indiana.edu:8000/wfiu_hi.m3u"
alias news="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls" # MPR News
alias npr='mplayer -playlist http://www.npr.org/templates/dmg/dmg.php\?getProgramStream\=true\&NPRMediaPref\=WM'
alias current="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/the_current.pls" # The Current
alias classical="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls" # Classical MPR
alias jazz='mplayer http://streamerepsilon.jazz.fm:8000'
alias beatles='mplayer http://uplink.duplexfx.com:8062'
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

dumpwnyc () {
    mplayer -playlist "http://www.wnyc.org/stream/wnyc-fm939/mp3.pls" -dumpstream -dumpfile wnyc-`date +%Y-%b-%d--%H.%Mhs`.mp3
}

record(){
    # references:
    # http://mocha.freeshell.org/audio.html
    # http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
    [ -z "$1" ] && name="output.mp3" || name="$1"
    arecord -v -f cd -t raw | lame -r - $name
}

# firefox improviments
# disalbe rendering fonts in firefox to free memory
export MOZ_DISABLE_PANGO='1'

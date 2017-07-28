# Last Change: sáb 15 out 2016 13:12:28 BRT
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# http://www.caliban.org/bash/

#                  ( O O )
#   +===========oOO==(_)==OOo==============+
#   |                                      |
#   |     °v°   Sergio Luiz Araujo Silva   |
#   |    /(_)\  Linux User #423493         |
#   |     ^ ^   voyeg3r   gmail.com       |
#   +======================================+
#
# References: https://github.com/fnichol/bashrc/blob/master/bashrc

INPUTRC=~/.inputrc

# avoid ctrl-s freeze your terminal
stty stop ""

# protegendo arquivos contra sobrescrita
#set -o noclobber

# bash completion to sudo command
complete -cf sudo
complete -cf man
complete -cf gksu
complete -d cd mkdir rmdir
# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh
complete -A file -X '!*.@(Z|gz|tgz)' gunzip

[ -f ~/.vim/git-completion.bash ] && source ~/.vim/git-completion.bash

function gm() {
     git commit -am "$1" && git push
}

[ -f ~/.bash_aliases ] && . ~/.bash_aliases


htmldecode() { : "${*//+/ }"; echo -e "${_//&#x/\x}" | tr -d ';'; }
urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

alias allcomm='whatis `compgen -c` | less' # list all possible commands
alias x='extract'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias proz='proz -v -f -s'
alias xclip='xclip -selection c'
alias config-date='sudo ntpdate -u -b bonehed.lcs.mit.edu'
alias aria2c='aria2c -x5 -c'
alias 4shared='cadaver http://webdav.4shared.com/'
alias compilalivro='make clean; make && make show'
#alias updatelivro='hg push ssh://hg@bitbucket.org/sergio/learn-english'
alias less='less -r'
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias lsd="ls -d */"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
#alias rm='mv -t ~/.local/share/Trash/files'
alias syncode='cd ~/.vim && git push -u origin master'
alias ssh="ssh -C"
alias scp='scp -r '
alias gril="grep -ril"
alias youtube-dl="youtube-dl -t"
alias xterm='/usr/bin/xterm -ls -bg black -fg white -cr -fs 11 white -hc white rightbar'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lvim="vim -c \"normal '0\""
alias cdesk="cd ${HOME}/Desktop"
alias iso2utf='iconv -f iso-8859-1 -t utf-8'
alias utf2iso='iconv -f utf-8 -t iso-8859-1'
alias path='echo -e ${PATH//:/\\n}'
[ -e `which vim` ] &&  alias vi='vim'
command -v apt-proz >/dev/null && INSTALLER="apt-proz" || INSTALLER="apt-get"
#alias update='sudo apt-proz update'
alias upgrade='sudo apt-proz update && sudo apt-proz upgrade'
alias acs='apt-cache search'
alias install='sudo apt-proz -y install'

# Listen to Air Traffic Control, used to be scripts.
alias GIG='mplayer http://rio.radioetvweb.com.br:8246'
alias GRU='mplayer http://rio.radioetvweb.com.br:8298'
alias POA='mplayer http://rio.radioetvweb.com.br:8282'
alias CGH='mplayer http://rio.radioetvweb.com.br:8300'
alias classic='mplayer http://80.237.154.83:8120'

# watch aljazeera
alias alj='rtmpdump -v -r "rtmp://aljazeeraflashlivefs.fplive.net/aljazeeraflashlive-live/aljazeera_eng_med" | mplayer -'

shopt -s histverify                    # verifica comandos do histórico
shopt -s checkwinsize                  # ajusta janela redimensionada
shopt -s hostcomplete
shopt -s extglob
[ ${BASH_VERSINFO[0]} -ge 4 ] && shopt -s globstar
shopt -s cdspell                       # fix wrong type keys
shopt -s dirspell
shopt -s autocd

update(){
 yaourt -Syua firefox-nightly
}

# convert text to lowcase
lower() { echo "${@}" | awk '{print tolower($0)}' ;}
upper() { echo "${@}" | awk '{print toupper($0)}' ;}
expandurl() { curl -sIL $1 | awk '/^Location/ || /^Localização/ {print $2}' ; }
calc(){ echo "scale=2;$@" | bc;}
ff () { find . -type f -iname '*'"$@"'*' ; }
mkcd() { mkdir -p "$@" && cd $_; }
gsend() { git commit -am "$1" && git push ;}
gst() { git status;}
decToBin () { echo "ibase=10; obase=2; $1" | bc; }
decTohex () { bc <<< "obase=16; $1"; }
biggest (){ du -k * | sort -nr | cut -f2 | head -20 | xargs -d "\n" du -sh; }
top10 () { history | awk '{print $2}' | sort | uniq -c | sort -rn | head ; }
beep () { echo -e -n \\a ; }
dict() { curl "dict://dict.org/d:${1%%/}";}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# trying to fix sound in gnash flash
export SDL_AUDIODRIVER=alsa
export AUDIODEV=plug:dmix

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:pwd:[bf]g:ssh *:exit"
export LS_COLORS=$LS_COLORS:"*.wmv=01;35":"*.wma=01;35":"*.flv=01;35":"*.m4a=01;35":"*.mp3=01;35":"*.mp4=01;35"

function add_ls_colors { export LS_COLORS="$LS_COLORS:$1"; }
    #export LS_COLORS=
    add_ls_colors "*.ps=00;35:*.eps=00;35:*.pdf=00;35:*.svg=00;35"
    add_ls_colors "*.jpg=00;35:*.png=00;35:*.gif=00;35"
    add_ls_colors "*.bmp=00;35:*.ppm=00;35:*.tga=00;35"
    add_ls_colors "*.xbm=00;35:*.xpm=00;35:*.tif=00;35"
    add_ls_colors "*.png=00;35:*.mpg=00;35:*.avi=00;35"
    ## Archive files
    add_ls_colors "*.tar=00;31:*.tgz=00;31:*.arj=00;31"
    add_ls_colors "*.taz=00;31:*.lzh=00;31:*.zip=00;31"
    add_ls_colors "*.z=00;31:*.Z=00;31:*.gz=00;31"
    add_ls_colors "*.bz2=00;31:*.deb=00;31:*.rpm=00;31"
    ## Fixes
    add_ls_colors "*.com=00;00:"


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [[ "$(id -un)" != "root" ]]; then
PS1='`[ $? = 0 ] && echo "\[\033[01;34m\]✔\[\033[00m\]"\
  || echo "\[\033[01;31m\]✘\[\033[00m\]"` [\A] \[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
# prompt para o root
#PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='`[ $? = 0 ] && echo "\[\033[01;34m\]✔\[\033[00m\]" ||\
  echo "\[\033[01;31m\]✘\[\033[00m\]"` [\A] \[\033[01;31m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

export PROMPT_COMMAND='echo -ne "\033]0;"`hostname -I`"\007"'

getextension () {
  echo "Full filename: $(basename ${1})"
  echo "Extension: ${1##*.}"
  echo "without extension: ${1%.*}"
}

getaudio () {
# dependences: libmp3lame-dev libmad0-dev and compile sox
# http://michalfapso.blogspot.com.br/2012/01/using-google-text-to-speech.html

  var="${@}"
  echo "${@}" > teste.txt

  filename="${var// /_}.mp3"
  speak.pl en teste.txt "$filename"
  rm -rf "$filename".tmp && rm -f teste.txt
  echo "[sound:${filename}]" | xclip -selection c
  mpg123 "$filename"
}

eng2audio () {
# see this: https://gist.github.com/michalfapso/3110049/raw
# http://michalfapso.blogspot.com.br/2012/01/using-google-text-to-speech.html
# http://mostovenko.blogspot.com.br/2012/04/voicing-messages-in-python-or-fun-with.html
# versão no snipt: https://snipt.net/voyeg3r/

# how truncate string  --> echo ${var:start:end}
# removendo o último caractere de uma variável   ${var:0:-1}
#   vou precisar truncar a string::::: echo "Sua string contém "${#var}" caracteres"
if   ping -q -c2 www.google.com >/dev/null ; then
        FILENAME="${@:?Usage: $0 give me some words to speech}"
        FILENAME=`awk '{print tolower($0)}' <<< "$FILENAME"`
        url="http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q="
        wget -q -U Mozilla -O "${FILENAME// /_}.mp3" "${url}${FILENAME// /+}+' '"
        [ -f "${FILENAME// /_}.mp3" -a ! -s "${FILENAME// /_}.mp3" ] && { rm -f "${FILENAME// /_}.mp3" ; echo 'error!'; }
        command -v mpg123 > /dev/null && mpg123 -q "${FILENAME// /_}.mp3"
        echo "[sound:${FILENAME// /_}.mp3]" | xclip -selection c
fi
}

mp4tomp3 () {
# http://stackoverflow.com/questions/5365090/removing-extension-from-file-without-knowing-it
command -v ffmpeg > /dev/null || sudo apt-get install -y ffmpeg
command -v lame > /dev/null || sudo apt-get install -y gstreamer0.10-plugins-ugly

  local var="${1%.*}"                              # strip extension
  local newname="${var// /_}.mp3"                  # get rid space and add mp3 extension
  ffmpeg -i "$1" -f mp3 -ab 320000 -vn "$newname"
}

youtube-mp3 () {
# put thins function in your ~/.bashrc

  ${1:?"error: I need a youtube link"}

  # testing existence of programs
  NEEDED_COMMANDS="youtube-dl ffmpeg"
  missing_counter=0
  for needed_command in $NEEDED_COMMANDS; do
    if ! hash "$needed_command" >/dev/null 2>&1; then
      printf "Command not found in PATH: %s\n" "$needed_command" >&2
      ((missing_counter++))
    fi
  done
  if ((missing_counter > 0)); then
    sudo apt-get install -y $NEEDED_COMMANDS
  fi

  # geting video and converting with ffmpeg
  youtube-dl --restrict-filenames -x --audio-format=mp3 --audio-quality 320k  "${1}"
}

geturls () {
# source: http://stackoverflow.com/questions/2804467/spider-a-website-and-return-urls-only
${1?"Usage: geturls Link"}
wget -q "$1" -O - | \
    tr "\t\r\n'" '   "' | \
    grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | \
    sed -e 's/^.*"\([^"]\+\)".*$/\1/g'
}

backup() {
  file=${1:?"error: I need a file to backup"}

  timestamp=$(date '+%Y-%m-%d-%H:%M:%S')
  backupdir=~/backups

  [ -d ${backupdir} ] || mkdir -p ${backupdir}
  cp -a ${file} ${backupdir}/$(basename ${file}).${timestamp}
  return $?
}

#diskusage() {
# du -ks "$@" | sort -nr | \
# awk '{ \
# if ($1 > 1048576) printf("%8.2fG", $1/1048576) ; \
#   else if ($1 > 1024) printf("%8.2fM", $1/1024) ; \
#   else printf("%8.2fK", $1) ; \
#   sub($1, "") ; print \
# }'
#}

getmp3 (){
${1?"Usage: getmp3 Link"}
for i in "`wget -q "$1" -O - | grep -i -o 'http://.*\.mp3'`"; do
  wget -c "$i"
done
}

compact() {
# source: http://jfmitre.com/2012/10/compactando-arquivos-no-terminal-do.html
# compact arquivo_compactado.EXTENSÃO lista de arquivos para compactar
     if [ "$#" -ge "1" ]; then
        case "$1" in
          *.[tT][aA][rR].[bB][zZ]|*.[tT][bB][zZ])
                  local file="$1"; shift; tar jcvf "$file" "$@" ;;
          *.[tT][aA][rR].[bB][zZ]2|*.[tT][bB][zZ]2)
                   local file="$1"; shift; tar jcvf "$file" "$@" ;;
          *.[tT][aA][rR].[gG][zZ]|*.[tT][gG][zZ])
                   local file="$1"; shift; tar zcvf "$file" "$@" ;;
          *.[gG][tT][gG][zZ])
                   local file="$1"; shift; tar zcvf "$file" "$@" ;;
          *[bB][zZ]2)
                   shift; bzip2 -z -k "$@"  ;;
          *.[rR][aA][rR])
                    local file="$1"; shift; rar a -r "$file"  "$@" ;;
          *[gG][zZ])
                     shift; gzip -r "$@"  ;;
          *.[tT][aA][rR])
                     local file="$1"; shift; tar cvf "$file" "$@" ;;
          *.[zZ][iI][pP])
                     local file="$1"; shift; zip -r "$file" "$@" ;;
          *.7[zZ])
                     local file="$1"; shift; 7z a -r "$file" "$@" ;;
          *.[xX][zZ])
                     local file="$1"; shift; tar Jcvf "$file" "$@" ;;
          *)    echo "don't know how to compact '$i' ..." ;;
        esac
      else
        echo "Insufficient arguments."
      fi ; }

extract() {
  # agradeça esta função ao J.F.Mitre
  # http://jfmitre.com/2010/11/descompactando-arquivos-no-terminal-do.html
    for i in "$@";  do
        if [ -f "$i" ]; then
            case "$i" in
                *.[tT][aA][rR].[bB][zZ]|*.[tT][bB][zZ])   tar xjvf "$i" ;;
                *.[tT][aA][rR].[bB][zZ]2|*.[tT][bB][zZ]2) tar xjvf "$i" ;;
                *.[tT][aA][rR].[gG][zZ]|*.[tT][gG][zZ])   tar xzvf "$i" ;;
                *.[gG][tT][gG][zZ])                       tar xzvf "$i" ;;
                *.[bB][zZ]2)                              bunzip2 "$i" ;;
                *.[rR][aA][rR])                           rar x -o+ "$i" ;;
                *.[gG][zZ])                               gunzip "$i" ;;
                *.[tT][aA][rR])                           tar xvf "$i" ;;
                *.[zZ][iI][pP])                           unzip -o "$i" ;;
                *.Z)                                      uncompress "$i" ;;
                *.7[zZ])                                  7z x "$i" ;;
                *)                                        echo "don't know how to extract '$i' ..." ;;
            esac
        else
               echo "$i is not a valid file"
        fi
    done
   }

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Evita histórico com linhas duplicadas
export HISTCONTROL=ignoredups

# configuração do path
if [ -d /usr/local/texlive/2013/bin/i386-linux ] ; then
  PATH=/usr/local/texlive/2013/bin/i386-linux:$PATH
  PATH=/usr/local/texlive/2013/texmf-dist/doc/man:$PATH
fi

[ -d /bin ] && PATH=~/bin:$PATH

# para chamar o pythonrc
PYTHONSTARTUP="$HOME/.pythonstartup"
export PYTHONSTARTUP

shell () {
  ps | grep `echo $$` | awk '{ print $4 }'
}

groove-dl-cli(){ python2.7 /usr/share/groove-dl/groove.py "$@" ;}

up () {
# Created at: 2012/06/19 10:37:26
# Go up directory tree X number of directories
# source: http://orangesplotch.com/bash-going-up/
# see explanation at link above, worth!
# I found this here: http://askubuntu.com/questions/110922/climb-up-the-directory-tree-faster
# put this function to your ~/.bashrc
# binding this function to key see below
# http://stackoverflow.com/questions/4200800/in-bash-how-do-i-bind-a-function-key-to-a-command

    COUNTER="$@";
  # default $COUNTER to 1 if it isn't already set
  if [[ -z $COUNTER ]]; then
    COUNTER=1
  fi
  # make sure $COUNTER is a number
  if [ $COUNTER -eq $COUNTER 2> /dev/null ]; then
    nwd=`pwd` # Set new working directory (nwd) to current directory
    # Loop $nwd up directory tree one at a time
    until [[ $COUNTER -lt 1 ]]; do
      nwd=`dirname $nwd`
      let COUNTER-=1
    done
    cd $nwd # change directories to the new working directory
  else
    # print usage and return error
    echo "usage: up [NUMBER]"
    return 1
  fi
}

myip (){
  clear
  echo
    DEV=`awk '/UG/ {print $NF}' <(/sbin/route -n)`
  #DEV=`awk '/eth/ {print $1}' <(netstat -i)` # indentifica o device
  IPLOCAL=`hostname -I`
  MEUIP=`awk '/inet end/ {print $3}' <(/sbin/ifconfig $DEV)`
  IPEXTERNO=`curl --connect-timeout 4 -s sputnick-area.net/ip`
  echo "        IP LOCAL: .....${IPLOCAL:-'off-line'}"
  echo "        NETMASK: ......`awk -F':' '/Mas/ {print $4}' <(/sbin/ifconfig $DEV)`"
  echo "        MAC ADDRESS: ..`awk '/HW/ {print $7}' <(/sbin/ifconfig $DEV)`"
  echo "        ROUTER: .......`awk '/UG/ {print $2}' <(/sbin/route -n)`"
    echo "        IP EXTERNO: ...${IPEXTERNO}"
    echo
    read -sn 1 -p "     Pressione uma tecla para continuar..."
  clear
}

_getdomainnameonly(){
    local f="${1,,}"
    # remove protocol part of hostname
    f="${f#http://}"
    f="${f#https://}"
    f="${f#ftp://}"
    f="${f#scp://}"
    f="${f#scp://}"
    f="${f#sftp://}"
    # remove username and/or username:password part of hostname
    f="${f#*:*@}"
    f="${f#*@}"
    # remove all /foo/xyz.html*
    f=${f%%/*}
    # show domain name only
    echo "$f"
}

ping(){
    local array=( "-n -c 4 -i 0.2 -W1" "$@"  )              # get all args in an array
    local len=${#array[@]}          # find the length of an array
    local host=${array[$len-1]}     # get the last arg
    local args=${array[@]:0:$len-1} # get all args before the last arg in $@ in an array
    #local _ping="/bin/ping"
    local c=$(_getdomainnameonly "$host")
    [ "$t" != "$c" ] && echo "Sending ICMP ECHO_REQUEST to \"$c\"..."
    # pass args and host
    #$_ping $args $c # improving script
    command ping $args $c
}

host(){
    local array=( $@ )
    local len=${#array[@]}
    local host=${array[$len-1]}
    local args=${array[@]:0:$len-1}
    #local _host="/usr/bin/host"
    local c=$(_getdomainnameonly "$host")
    [ "$t" != "$c" ] && echo "Performing DNS lookups for \"$c\"..."
    #$_host $args $c
    command host $args $c
}

export LESS="-P ?c<- .?f%f:Standard input.  ?n:?eEND:?p%pj\%.. .?c%ccol . ?mFile %i of %m  .?xNext\ %x.%t   Press h for help"
man() { # wrapper para o comando man
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

apt-history () {
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

# set o vim como editor padrão
export EDITOR=vim
export VISUAL=vim

CDPATH=.:..:~:~/docs/img:~/docs:~/bin:~/tmp

export PROMPT_COMMAND="history -a"
export HISTFILESIZE=2000

# desabilitando a biblioteca pango para o firefox
export MOZ_DISABLE_PANGO=1

# http://ubuntuforums.org/archive/index.php/t-80289.html
export FLASH_GTK_LIBRARY=libgtk-x11-2.0.so.0

if [ -d /var/lib/gems/1.8 ]; then
  export PATH=/var/lib/gems/1.8/bin:$PATH
fi

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
#export ZZOFF=""  # desligue funcoes indesejadas
#export ZZPATH="/home/sergio/bin/funcoeszz"  # script
#source "$ZZPATH"

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
#source /usr/bin/funcoeszz
#export ZZPATH=/usr/bin/funcoeszz

if [ -d ~/anaconda ] ; then
# added by Anaconda 1.8.0 installer
# "source activate ~/anaconda"
# http://va.mu/dkRc
export PATH="/home/sergio/anaconda/bin:$PATH"
fi

# init configuration of fasd tool ##############
# source: https://github.com/clvv/fasd
eval "$(fasd --init auto)"

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi

source "$fasd_cache"
unset fasd_cache
# interactive fasd
alias zi="fasd -e cd -i"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
#### end configuration of fasd tool ##############

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

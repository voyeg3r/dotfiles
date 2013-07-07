# Last Change: 2013 Jul 07 09:14:02
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

INPUTRC=~/.inputrc

# avoid ctrl-s freeze your terminal
stty stop ""

# protegendo arquivos contra sobrescrita
#set -o noclobber

# bash completion to sudo command
complete -cf sudo
complete -d cd mkdir rmdir

source ~/.vim/git-completion.bash

alias xclip='xclip -selection c'
alias config-data='sudo ntpdate -u -b bonehed.lcs.mit.edu'
alias aria2c='aria2c -x5 -c'
alias 4shared='cadaver http://webdav.4shared.com/'
alias compilalivro='make clean; make && make show'
alias updatelivro='hg push ssh://hg@bitbucket.org/sergio/learn-english'

# testa se há o comando grin e exporta variáveis do mesmo
which grin &>/dev/null && export GRIN_ARGS="-C 2 --no-skip-dirs"

# se houver o navegador epiphany torne ele o navegador padrão
#which epiphany-browser &>/dev/null && { export BROWSER=`which epiphany-browser` ;}

shopt -s histverify                    # verifica comandos do histórico
shopt -s checkwinsize                  # ajusta janela redimensionada
shopt -s hostcomplete
shopt -s extglob
[ ${BASH_VERSINFO[0]} -ge 4 ] && shopt -s globstar
shopt -s cdspell                       # fix wrong type keys
shopt -s dirspell


adkey () {
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $1
}

# convert text to lowcase
lower() { echo "${@}" | awk '{print tolower($0)}' ;}
upper() { echo "${@}" | awk '{print toupper($0)}' ;}
expandurl() { curl -sIL $1 | awk '/^Location/ || /^Localização/ {print $2}' ; }
# calculadora com o comando bc
calc(){ echo "scale=2;$@" | bc;}
ff () { find . -type f -iname '*'"$@"'*' ; }
mkcd() { mkdir -p "$@" && cd $_; }
function decToBin { echo "ibase=10; obase=2; $1" | bc; }
decTohex() { bc <<< "obase=16; $1"; }

biggest (){
    du -k * | sort -nr | cut -f2 | head -20 | xargs -d "\n" du -sh
#du  | sort -r -n | awk '{split("k m g",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}'
}

top10 () {
	history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

beep () {
echo -e -n \\a
}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:pwd:[bf]g:ssh *:exit"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"



# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# retorna um prompt bem legal
# reference: http://traviscline.com/blog/2007/09/03/how-i-color-my-bash-prompts/
#PS1='`if [ $? = 0 ]; then echo "✔"; else echo "✘"; fi` [$(date +%H:%M)] \u \w \$: '

if [[ "$(id -un)" != "root" ]]; then
PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔\[\033[00m\]"; else echo "\[\033[01;31m\]✘\[\033[00m\]"; fi` \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
# prompt para o root
#PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔\[\033[00m\]"; else echo "\[\033[01;31m\]✘\[\033[00m\]"; fi` \[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

[ -f ~/.bash_aliases ] && . ~/.bash_aliases


getaudio () {
# dependences: libmp3lame-dev libmad0-dev and compile sox
# http://michalfapso.blogspot.com.br/2012/01/using-google-text-to-speech.html

var="${@}"
echo "${@}" > teste.txt

filename="${var// /_}.mp3"
speak.pl en teste.txt "$filename"
rm -rf "$filename".tmp && rm -f teste.txt
echo "[sound:${filename}]" | xclip -selection c
mpg321 "$filename"
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
        command -v mpg321 > /dev/null && mpg321 -q "${FILENAME// /_}.mp3"
        echo "[sound:${FILENAME// /_}.mp3]" | xclip -selection c
fi
}

geturls () {
# source: http://stackoverflow.com/questions/2804467/spider-a-website-and-return-urls-only
${1?"Usage: geturls Link"}
wget -q "$1" -O - | \
    tr "\t\r\n'" '   "' | \
    grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | \
    sed -e 's/^.*"\([^"]\+\)".*$/\1/g'
}

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

alias syncode='cd ~/.vim && git push -u origin master'

alias ssh="ssh -C"
alias scp='scp -r '
alias gril="grep -ril"
alias youtube-dl="youtube-dl -t"

# xterm
alias xterm='xterm -ls -bg black -fg white -cr -fs 11 white -hc white rightbar'

alias apt-get="apt-get -o Acquire::http::Dl-Limit=15"

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# alias para abrir o último arquivo editado pelo vim
alias lvim="vim -c \"normal '0\""

alias cdesk="cd ${HOME}/Desktop"
alias update='sudo apt-fast update'
alias upgrade='sudo apt-fast upgrade'
alias upgradef='sudo apt-fast update && sudo apt-fast upgrade'
alias install='sudo apt-fast install'

# Dica retirada do blog do mitre
# http://jfmitre.blogspot.com/2006/05/convertendo-arquivos-utf-8-em-isso-8859.html
alias iso2utf='iconv -f iso-8859-1 -t utf-8'
alias utf2iso='iconv -f utf-8 -t iso-8859-1'

# mostra os dez comandos mais utilizados
# history | awk '{print $2}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -n | tail | sort -nr

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Evita histórico com linhas duplicadas
export HISTCONTROL=ignoredups

# configuração do path
PATH=~/bin:/usr/local/texlive/2012/bin/i386-linux:$PATH

alias path='echo -e ${PATH//:/\\n}'

# para chamar o pythonrc
PYTHONSTARTUP="$HOME/.pythonstartup"
export PYTHONSTARTUP



up (){
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
	MEUIP=`hostname -I`
	MEUIP=`awk '/inet end/ {print $3}' <(/sbin/ifconfig $DEV)`
	echo "        IP LOCAL: .....${MEUIP:-'Not connected'}"
	echo "        NETMASK: ......`awk -F':' '/Mas/ {print $4}' <(/sbin/ifconfig $DEV)`"
	echo "        MAC ADDRESS: ..`awk '/HW/ {print $7}' <(/sbin/ifconfig $DEV)`"
	echo "        ROUTER: .......`awk '/UG/ {print $2}' <(/sbin/route -n)`"
    echo "        IP EXTERNO: ...`curl --connect-timeout 4 -s sputnick-area.net/ip`"
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

export PATH=/var/lib/gems/1.8/bin:$PATH

# manpages coloridas
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


# Instalacao das Funcoes ZZ (www.funcoeszz.net)
#export ZZOFF=""  # desligue funcoes indesejadas
#export ZZPATH="/home/sergio/bin/funcoeszz"  # script
#source "$ZZPATH"

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
source /usr/bin/funcoeszz
export ZZPATH=/usr/bin/funcoeszz

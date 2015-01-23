# Arquivo: ~/.zshrc
# Criado: Qua 08/Jan/2014 hs 19:24
# Last Change: Thu Jan 22, 2015  10:03PM
# autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# email: <voyeg3r at gmail.com>
#
#                ( O O )
# +===========oOO==(_)==OOo==============+
# |                                      |
# |     °v° Sergio Luiz Araujo Silva     |
# |    /(_)\ Linux User #423493          |
# |     ^ ^ voyeg3r  gmail.com          |
# +======================================+
#
# # Reference: https://github.com/plitc/zshrc/blob/master/.zshrc

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

# path and cdpath
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
cdpath=(. .. ~/bin ~/docs ~/docs/img ~/tmp)
path=(~/bin $path)


# theme
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"


# fasd or autojump
#[[ -s /etc/profile.d/autojump.zsh ]] && . /etc/profile.d/autojump.zsh
# I am using now fasd: https://github.com/clvv/fasd

# needed to load fasd utility
 eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"


# fasd_cd + outputs directory
fasd_cd() {
 if [ $# -le 1 ]; then
fasd "$@"
 else
local _fasd_ret="$(fasd -e 'printf %s' "$@")"
 [ -z "$_fasd_ret" ] && return
 [ -d "$_fasd_ret" ] && print "$_fasd_ret" && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
 fi
}

# as an autojump user, i need only this for now
alias j=' fasd_cd -d'

# auto open images
alias -s jpg="feh -FZd"
alias -s JPG="feh -FZd"
alias -s jpeg="feh -FZd"
alias -s JPEG="feh -FZd"
alias -s png="feh -FZd"
alias -s gif="feh -FZd"
alias -s txt=gvim
alias -s tex=vim

alias update='yaourt -Syua'

# basic fonfig
HISTFILE=~/.zhistory
HISTSIZE=25000
SAVEHIST=25000
HOSTNAME="`/bin/hostname`"
PAGER='less'
EDITOR='vim'

#setopt auto_list  #list choices on an ambiguous completion
setopt zle
setopt completealiases
autoload -U compinit && compinit

setopt extendedglob

autoload -U zsh-mime-setup
zsh-mime-setup

# zmv "programmable rename"
autoload -Uz zmv

# edit command line with Esc-e
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# usar Ctrl-esc + s
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo
bindkey "^Xs" insert-sudo

# Move to where the arguments belong. | use Ctrl-x 1
after-first-word() {
 zle beginning-of-line
 zle forward-word
}
zle -N after-first-word
bindkey "^X1" after-first-word

# Increase/decrease last numeric word.
# 04jan2013  +chris+  using incarg
# 12mar2013  +chris+  revert to own implementation, improved
_increase_number() {
 local -a match mbegin mend
 [[ $LBUFFER =~ '([0-9]+)[^0-9]*$' ]] &&
 LBUFFER[mbegin,mend]=$(printf %0${#match[1]}d $((10#$match+${NUMERIC:-1})))
}
zle -N increase-number _increase_number
bindkey '^Xa' increase-number
bindkey -s '^Xx' '^[-^Xa'

# magic-space and more
globalias() {
 if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
 zle _expand_alias
 fi
 zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
#

# aliases#
alias install='sudo apt-fast -y install'
groove-dl-cli(){ python2.7 /usr/share/groove-dl/groove.py "$@" ;}
alias ping='ping -n -c 4 -i 0.2 -W1'
alias shell='echo ${SHELL:t}'
alias lvim="vim -c \"normal '0\""
alias vnew='cd && vim */**(.om[1])'
alias ls='ls --color'
alias path='echo $PATH | tr ":" "\n"'
alias ssh='ssh -C'
alias scp='scp -r'
alias less='less -r'
alias compilalivro='make clean; make && make show'
alias 4shared='cadaver http://webdav.4shared.com/'
alias yd='youtube-dl --write-auto-sub `xclip -o`'

# don't expand aliases _before_ completion has finished
# like: git comm-[tab]
setopt complete_aliases

# Listen to Air Traffic Control, used to be scripts.
alias GIG='mplayer http://rio.radioetvweb.com.br:8246'
alias GRU='mplayer http://rio.radioetvweb.com.br:8298'
alias POA='mplayer http://rio.radioetvweb.com.br:8282'
alias CGH='mplayer http://rio.radioetvweb.com.br:8300'
alias classic='mplayer http://80.237.154.83:8120'
# watch aljazeera
alias alj='rtmpdump -v -r "rtmp://aljazeeraflashlivefs.fplive.net/aljazeeraflashlive-live/aljazeera_eng_med" | mplayer -'
alias -s txt=vim
alias -s text=vim
alias gril='grep -irl'
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
alias -g DN='>/dev/null'     # a /dev/null shortcut
alias -g LC='| tr A-Z a-z'
alias -g UL="| sed 's, ,_,g'"
alias -g ULC="| tr A-Z a-z | sed 's, ,_,g'"
alias pnf='mpg123 ./**/*(.om[1])'

# aliases para fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim'       # open file with vim
alias v='f -t -e vim -b viminfo'
alias o='a -e xdg-open'  # quick opening files with xdg-open
alias _!='fc -e "sed -i -e \"s/^/sudo /\""'  # sudo last command

## complete
# zstyle - completions
# autocomplete file
zstyle :compinstall filename '/home/sergio/.zshrc'

# Auto-completar para o comando 'kill':
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:processes' command 'ps x -o pid,command'
# zstyle ':completion:*:processes-names' command 'ps axho command'
# #zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'
#zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Faster! (?)
#zstyle ':completion:*' use-cache on
[ ! -e ~/.zsh_cache ] && touch ~/.zsh_cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

# oh my zsh tips
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"
# end tips

# plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(archlinux extract fasd git git-prompt sudo battery pacman cp sudo themes history-substring-search zsh-syntax-highlighting)

#

source $ZSH/oh-my-zsh.sh

# wrapper function to ping command
fpath=( $HOME/.dotfiles/functions "${fpath[@]}" )
#autoload -Uz ping host

# load custom executable functions
for function in ~/.dotfiles/functions/*; do
 source $function
done

arch=$(uname -m)

# functions
yt () mplayer -fs -quiet $(youtube-dl -g "$1")
gsend() { git commit -am "$1" && git push ;}
lowerstring() { echo "${*}" | awk '{print tolower($0)}' ;}
upper() { echo "${*}" | awk '{print toupper($0)}' ;}
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

youtube-mp3 () {
# get mp3 from youtube
command -v ffmpeg >/dev/null && youtube-dl --restrict-filenames --extract-audio --audio-format=mp3 --audio-quality 320k  "${1}"
[[ $? = 1 ]] && echo "instale o programa ffmpeg para poder converter para mp3"
}

record(){
# references:
# http://mocha.freeshell.org/audio.html
# http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
 [ -z "$1" ] && name="output.mp3" || name="$1"
 arecord -v -f cd -t raw | lame -r - $name
}


# end functions

# firefox improviments
# disalbe rendering fonts in firefox to free memory
export MOZ_DISABLE_PANGO='1'


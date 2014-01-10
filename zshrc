# Arquivo: ~/.zshrc
# Criado: Qua 08/Jan/2014 hs 19:24
# Last Change: 2014 Jan 09 21:51:13
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
#
#
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh


export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
alias lvim="vim -c \"normal '0\""
cdpath=(. .. ~/bin ~/docs ~/docs/img ~/tmp)
path=(~/bin $path)
alias path='echo $PATH | tr ":" "\n"'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

[[ -s /etc/profile.d/autojump.zsh ]] && . /etc/profile.d/autojump.zsh

HISTFILE=~/.zhistory
HISTSIZE=25000
SAVEHIST=25000
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'

setopt auto_list  #list choices on an ambiguous completion



# # http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
# globalias() {
#    if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
#      zle _expand_alias
#      zle expand-word
#    fi
#    zle self-insert
# }
#
# bindkey " " globalias
# bindkey "^ " magic-space           # control-space to bypass completion
# bindkey -M isearch " " magic-space # normal space during searches
#
autoload -U compinit && compinit

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

# aliases
alias ls='ls --color'
alias path='echo $PATH | tr ":" "\n"'
alias lvim="vim -c \"normal '0\""
alias ssh='ssh -C'
alias scp='scp -r'
alias less='less -r'
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

# Auto-completar para o comando 'kill':
zstyle ':completion:*' group-name ''
zstyle ':completion:*:processes' command 'ps x -o pid,command'
zstyle ':completion:*:processes-names' command 'ps axho command'
#zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Faster! (?)
#zstyle ':completion:*' use-cache on
zstyle ':completion:*' use-cache 1
zstyle ':completion:*' cache-path ~/.zsh_cache

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git pacman cp sudo themes history-substrin-search)

source $ZSH/oh-my-zsh.sh

# User configuration
yt () mplayer -fs -quiet $(youtube-dl -g "$1")
gsend() { git commit -am "$1" && git push ;}
lower() { echo "${@}" | awk '{print tolower($0)}' ;}
upper() { echo "${@}" | awk '{print toupper($0)}' ;}
expandurl() { curl -sIL $1 | awk '/^Location/ || /^Localização/ {print $2}' ; }
calc(){ echo "scale=2;$@" | bc;}
ff () { find . -type f -iname '*'"$@"'*' ; }
mkcd() { mkdir -p "$@" && cd $_; }
decToBin () { echo "ibase=10; obase=2; $1" | bc; }
decTohex () { bc <<< "obase=16; $1"; }
biggest (){ du -k * | sort -nr | cut -f2 | head -20 | xargs -d "\n" du -sh; }
top10 () { history | awk '{print $2}' | sort | uniq -c | sort -rn | head ; }
beep () { echo -e -n \\a ; }
dict() { curl "dict://dict.org/d:${1%%/}";}


# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# disalbe rendering fonts in firefox to free memory
export MOZ_DISABLE_PANGO='1'

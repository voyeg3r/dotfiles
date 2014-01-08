# Arquivo: ~/.zshrc
# Criado: Qua 08/Jan/2014 hs 19:24
# Last Change: 2014 Jan 08 20:03:02
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
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

[[ -s /etc/profile.d/autojump.zsh ]] && . /etc/profile.d/autojump.zsh

# config LaTeX path
if [[ -d /usr/local/texlive/2013/bin/i386-linux ]] ; then
        PATH=/usr/local/texlive/2013/bin/i386-linux:$PATH
        PATH=/usr/local/texlive/2013/texmf-dist/doc/man:$PATH
fi

INPUTRC=~/.inputrc

# Set name of the theme to load.j
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gentoo"
ZSH_THEME="bira"

setopt auto_cd
cdpath=(. .. ~/bin ~/docs ~/docs/img ~/tmp)

# if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
# 		source /usr/share/doc/pkgfile/command-not-found.zsh
# fi

setopt autopushd
setopt AUTO_CD
#setopt CORRECT_ALL
setopt EXTENDED_GLOB
setopt NO_HIST_BEEP
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE


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
plugins=(git github bundle python sudo extract archlinux colorize command-not-found common-aliases cp history-substring-search)

###################### fix cdpath shown subdirs #######################################
# source: http://superuser.com/questions/265547/zsh-cdpath-and-autocompletion#286713
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d

#You can apply standard prompt formats to these descriptions to make them stand out:

zstyle ':completion:*:descriptions' format %B%d%b        # bold
zstyle ':completion:*:descriptions' format %S%d%s        # invert/standout
zstyle ':completion:*:descriptions' format %U%d%u        # underline
zstyle ':completion:*:descriptions' format %F{green}%d%f # green foreground
zstyle ':completion:*:descriptions' format %K{blue}%d%k  # blue background

# Autocompletion options
# http://hawkradius.wordpress.com/2013/09/28/fun-with-linux-starting-out/
setopt completealiases
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
# With commands like rm, it's annoying if you keep getting offered the same
# file multiple times. This fixes it. Also good for cp, et cetera..
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:processes' command 'ps -au$USER'

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd
######################################################################################

##### functions
shell () {
  ps | grep `echo $$` | awk '{ print $4 }'
}

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
#
#
source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias ssh='ssh -C'
alias scp='scp -r'
alias less='less -r'
alias youtube-dl='youtube-dl -t'
alias path='echo -e ${PATH//:/\n}'
alias lvim="vim -c \"normal '0\""

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
alias -g L='| less'
alias -g T='| tail'
alias -g H='| head'
alias -g G='| grep -i'
alias -g V='| gvim -'
alias -g X='| xargs'

############ Automatically Expanding zsh Global Aliases - Simplified
# http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}


gs() { git commit -am "$1" && git push ;}
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


insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
############################################################################

# disalbe rendering fonts in firefox to free memory
export MOZ_DISABLE_PANGO='1'
# http://ubuntuforums.org/archive/index.php/t-80289.html
export FLASH_GTK_LIBRARY=libgtk-x11-2.0.so.0

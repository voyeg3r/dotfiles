# Path to your oh-my-zsh configuration.
ZSH=$HOME/.vim/oh-my-zsh

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
plugins=(git github bundle python sudo themes extract archlinux colorize command-not-found common-aliases cp)

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
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
# With commands like rm, it's annoying if you keep getting offered the same
# file multiple times. This fixes it. Also good for cp, et cetera..
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

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

alias path='echo -e ${PATH//:/\n}'
alias lvim="vim -c \"normal '0\""
alias -s txt=vim
alias -s text=vim
alias gril='grep -irl'
alias -g C='| wc -l'
alias -g T='| tail'
alias -g H='| head'
alias -g G='| grep -i'

############ Automatically Expanding zsh Global Aliases - Simplified
# http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
############################################################################

# disalbe rendering fonts in firefox to free memory
export MOZ_DISABLE_PANGO='1'

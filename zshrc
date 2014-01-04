# Path to your oh-my-zsh configuration.
ZSH=$HOME/.vim/oh-my-zsh

# Set name of the theme to load.j
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias path='echo -e ${PATH//:/\\n}'

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
plugins=(git github bundle python sudo themes vi-mode extract archlinux colorize command-not-found common-aliases cp)

##### functions
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

#alias path=echo -e ${PATH//:/\n}
alias lvim="vim -c \"normal '0\""

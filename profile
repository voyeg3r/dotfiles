# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

bind '\C-i:menu-complete'
bind 'set show-all-if-ambiguous on'
#bind 'show-all-if-unmodified on'
bind 'set completion-ignore-case on'   # turnon ignorecase
bind 'set match-hidden-files off'      # only show hiden files if call them
shopt -s checkwinsize                  # ajusta janela redimensionada
shopt -s hostcomplete
bind Space:magic-space                 # !pin<space>
bind '"\e[A"':history-search-backward  # completa ao usar seta acima
bind '"\e[B"':history-search-forward   # completa ao usar seta abaixo
#bind '"\e[5~"':"\"history 15\C-m\""   # show last 15 cmd's
bind '"\e[5~"':menu-complete           # complete tab options
bind '"\e[6~"':menu-complete-backward  # complete tab options (reverse)
[ ${BASH_VERSINFO[0]} -ge 4 ] && shopt -s globstar
shopt -s cdspell                       # fix wrong type keys
shopt -s dirspell

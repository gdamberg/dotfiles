
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Imports
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
if [ -f ~/.exports ]; then
    source ~/.exports
fi
if [ -f ~/.exports_local ]; then
    source ~/.exports_local
fi
if [ -f ~/.functions ]; then
    source ~/.functions
fi
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
if [ -f ~/.aliases_local ]; then
    source ~/.aliases_local
fi
if [ -f ~/.prompt ]; then
    source ~/.prompt
fi


# COLORS
BLACK="$(tput setaf 0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
PURPLE="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)$(tput bold)"
LIGHT_RED="$(tput setaf 1)$(tput bold)"
LIGHT_YELLOW="$(tput setaf 3)$(tput bold)"
LIGHT_GRAY="$(tput setaf 7)"
LIGHT_GREEN="$(tput setaf 2)$(tput bold)"
LIGHT_BLUE="$(tput setaf 4)$(tput bold)"
LIGHT_CYAN="$(tput setaf 6)$(tput bold)"
NO_COLOUR="$(tput sgr0)"
REVERSE="$(tput rev)"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob


# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ADD todo.txt to autocomplete
source ~/.dotfiles/tools/todo.txt-cli/todo_completion

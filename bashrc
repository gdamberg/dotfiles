# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Use the system config if it exists
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# source my 'dotfiles'
if [ -f "$HOME/.bashrc.dotfiles" ]; then
  source "$HOME/.bashrc.dotfiles"

  DOT_FILES=(functions aliases exports prompt)
  for file in "${DOT_FILES[@]}"
  do
    if [ -f "$DOTFILES_HOME/$file" ]; then
      source "$DOTFILES_HOME/$file"
    fi
  done
fi

# for local overrides and system specific stuff
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

# append to the history file, don't overwrite it
shopt -s histappend

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

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

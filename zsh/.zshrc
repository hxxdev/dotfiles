# shellcheck shell=zsh
# add some variables
export PATH_DEV="/home/hxxdev/dev"

# expand regex in command
setopt EXTENDED_GLOB

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=2000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history -n 1 | sed -e '\''s/^	*[0-9]	*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.zsh_aliases, instead of adding them here directly.
if [ -f ~/.zsh_startup ]; then
    . ~/.zsh_startup
fi

if [ -f ~/.zsh_alias ]; then
    . ~/.zsh_alias
fi

if [ -f ~/.zsh_env ]; then
    . ~/.zsh_env
fi

if [ -f ~/.zsh_private ]; then
    . ~/.zsh_private
fi

# Zsh completion system
autoload -Uz compinit
compinit

. "$HOME/.local/bin/env"

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
#    tmux attach || tmux new
#fi

# Added by `rbenv init` on Sat Jun  7 08:50:18 PM KST 2025
eval "$(rbenv init - --no-rehash bash)"

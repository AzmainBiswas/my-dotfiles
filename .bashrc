#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# eval "$(starship init bash)"

export PATH=/home/azmain/.local/bin:$HOME/bin:$HOME/scripts:$PATH
export EDITOR=nvim
export TERM=kitty
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export media=/mnt/media
export docs=/mnt/docs
export book=/mnt/docs/Book

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '

exec fish

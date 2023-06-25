#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/latex-bin:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH
export EDITOR=nvim
export TERM="xterm-256color"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export media=/mnt/media
export docs=/mnt/docs
export book=/mnt/docs/Book

alias ls='exa -aF --icons'
alias ll='exa -alF --icons'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '

#exec fish

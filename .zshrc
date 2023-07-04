export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

plugins=(git dirhistory dnf zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/azmain/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# options
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/latex-bin:$HOME/menu-scripts:$HOME/.cargo/bin:$PATH
export EDITOR=nvim
export TERM="xterm-256color"
export FZF_DEFAULT_OPTS='--height 70% --layout=reverse --border'
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export media=/mnt/media
export docs=/mnt/docs
export book=/mnt/docs/Book

alias ozc='nvim $HOME/.zshrc'
alias szc='source $HOME/.zshrc'
alias ls="exa -aF --icons --color=always --group-directories-first"
alias ll="exa -alF --icons --color=always --group-directories-first"
alias cls='clear'
alias grep='grep --color=auto'
alias spdl="spotdl --bitrate=320k"

alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

# ripgrep all
rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}


eval "$(starship init zsh)"
eval "$(thefuck --alias)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

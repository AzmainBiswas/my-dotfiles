#
# ~/.bashrc
#

eval "$(starship init bash)"
eval $(thefuck --alias)

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/latex-bin:$HOME/menu-scripts:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH
export EDITOR=nvim
export TERM="xterm-256color"
export FZF_DEFAULT_OPTS='--height 70% --layout=reverse --border'
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export media=/mnt/media
export docs=/mnt/docs
export book=/mnt/docs/Book

alias ls='exa -aF --icons'
alias ll='exa -alF --icons'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '

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

#exec fish


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

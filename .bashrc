#
# ~/.bashrc
#

# eval "$(starship init bash)"
# eval "$(oh-my-posh init bash --config $HOME/.config/oh-my-posh/my-oh-my-posh-gruvboc.omp.json)"
# eval $(thefuck --alias)

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/latex-bin:$HOME/menu-scripts:$HOME/.cargo/bin:$PATH

alias ls="ls -AF --color"
alias ll="ls -AlFh --color"
alias cls="clear"
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

PS1='\e[1;31m[\e[0m\e[1;32m\u\e[0m@\e[1;34m\h\e[0m \e[1;36m\w\e[0m\e[1;31m]\e[0m\$ '

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

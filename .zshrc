# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/my-oh-my-posh-gruvboc.omp.json)"
eval $(thefuck --alias)

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/latex-bin:$HOME/.cargo/bin:$PATH
export EDITOR=nvim
export TERM="xterm-256color"
export FZF_DEFAULT_OPTS='--height 75% --layout=reverse --border'
export STARSHIP_CONFIG=~/.config/starship/starship.toml

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway

alias ls='exa -aF --icons'
alias ll='exa -alF --icons'
alias grep='grep --color=auto'
alias du='sudo dnf update'
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'


alias du="sudo dnf upgrade"
alias di="sudo dnf install"
alias dr="sudo dnf remove"
alias ds="dnf search"
alias dnf="sudo dnf"

# Git
alias ga="git add"
alias gcl="git clone"
alias gcm="git commit"
alias gph="git push"
alias gpl="git pull"

alias vf='nvim $(fzf --height 75% --layout=reverse --border --preview "bat --style=numbers --color=always --line-range :500 {}" )'
alias ozc="nvim ~/.zshrc"
alias szc="source ~/.zshrc"
alias oic="nvim ~/.config/i3/config"
alias spdl="spotdl --bitrate=320k"
alias scenv="source ~/.venv-codding/bin/activate.fish"
alias movies="cd /mnt/media/video/movies/"
alias vsong="cd /mnt/media/video/songs/"
alias ocf="cd /mnt/docs/codding-and-programming/"
alias tx="TERM=xterm-256color tmux"

alias cls="clear"
alias ..="cd .."
alias ls="exa -aF --icons --color=always --group-directories-first"
alias ll="exa -alF --icons --color=always --group-directories-first"
alias tree="exa -F --icons --color=always --tree"
alias nv="nvim"
alias vim="nvim"
alias v="nvim"
alias book="cd /mnt/docs/Book"
alias music="cd /mnt/media/Music"
alias video="cd /mnt/media/video"
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

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

sd() {
    cd $(fdfind . --type  directory | fzf)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

PS1='\e[0m\e[1;32m\u\e[0m@\e[1;34m\h\e[0m \e[1;36m\w\e[0m\e[0m > '


# file extract
ex() {
    local file_name
    file_name="$(echo $1 | awk -F. '{print $1}')"
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   mkdir "./$file_name" && tar xvjf $1 --directory="./$file_name"  ;;
        *.tar.gz)    mkdir "./$file_name" && tar xvzf $1 --directory="./$file_name" ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       mkdir "./$file_name" && tar xvf $1 --directory="./$file_name" ;;
        *.tbz2)      mkdir "./$file_name" && tar xvjf $1 --directory="./$file_name" ;;
        *.tgz)       mkdir "./$file_name" && tar xvzf $1 --directory="./$file_name";;
        *.zip)       unzip $1 -d "./${file_name}"     ;;
        *.Z)         uncompress $1;;
        *.7z)        7za e x $1   ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    mkdir "./$file_name" && tar xvf $1 --directory="./$file_name" ;;
        *.tar.zst)   unzstd $1    ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

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

# bash parameter completion for the dotnet CLI

function _dotnet_bash_complete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
  local candidates

  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

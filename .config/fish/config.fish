if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

starship init fish | source

# Envioment variables
set -x TERM "alacritty"
set -x EDITOR "nvim"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x FZF_DEFAULT_COMMAND 'ag -g "" --hidden --ignore .git'
set -x STARSHIP_CONFIG /home/azmain/.config/starship/starship.toml

# paths
set -Ua fish_user_paths $HOME/bin $HOME/latex-bin $fish_user_path

abbr pacman "sudo pacman"
abbr aur "pikaur"
abbr pi "sudo pacman -Syu"
abbr pr "sudo pacman -Rs"
abbr ofc "nvim ~/.config/fish/config.fish"
abbr sfc "source ~/.config/fish/config.fish"
abbr oic "nvim ~/.config/i3/config"
abbr spdl "spotdl --bitrate=320k"
abbr scenv "source ~/.venv-codding/bin/activate.fish"
abbr movies "cd /mnt/media/video/movies/"
abbr vsong "cd /mnt/media/video/songs/"
abbr ocf "cd /mnt/docs/codding-and-programming/"
abbr tx "TERM=xterm-256color tmux"

alias cls "clear"
alias .. "cd .."
alias ls "exa -aF --icons --color=always --group-directories-first"
alias ll "exa -alF --icons --color=always --group-directories-first"
alias nv "nvim"
alias vim "nvim"
alias v "nvim"
alias book "cd /mnt/docs/Book"
alias music "cd /mnt/media/Music"
alias video "cd /mnt/media/video"
alias config '/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'


# Functions

# rga with fzf
function rga-fzf
    set RG_PREFIX 'rga --files-with-matches'
    if test (count $argv) -gt 1
        set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
    end
    set -l file $file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && \
    echo "opening $file" && \
    open "$file"
end

colorscript random

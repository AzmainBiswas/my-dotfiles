if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""
starship init fish | source

abbr lf "ranger"
abbr pacman "sudo pacman"
abbr aur "pikaur"
abbr pi "sudo pacman -Syu"
abbr pr "sudo pacman -Rs"
abbr ofc "nvim ~/.config/fish/config.fish"
abbr sfc "source ~/.config/fish/config.fish"
abbr oic "nvim ~/.config/i3/config"
abbr spdl "spotdl --bitrate=320k"
abbr smenv "source /mnt/media/venv_media/bin/activate.fish"
abbr scenv "source /mnt/docs/codding-and-programming/Python/venv_cod/bin/activate.fish"
abbr movies "cd /mnt/media/video/movies/"
abbr vsong "cd /mnt/media/video/songs"

alias cls "clear"
alias .. "cd .."
alias ls "exa -aF --icons"
alias ll "exa -alF --icons"
alias nv "nvim"
alias vim "nvim"
alias v "nvim"
alias book "cd /mnt/docs/Book"
alias music "cd /mnt/media/Music"
alias video "cd /mnt/media/video"
alias config '/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

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

neofetch

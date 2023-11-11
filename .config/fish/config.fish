if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

starship init fish | source
# oh-my-posh init fish --config $HOME/.config/oh-my-posh/my-oh-my-posh-gruvboc.omp.json | source
thefuck --alias | source

# Envioment variables
# flameshot 
set -xU SDL_VIDEODRIVER wayland
set -xU _JAVA_AWT_WM_NONREPARENTING 1
set -xU QT_QPA_PLATFORM wayland
set -xU XDG_CURRENT_DESKTOP sway
set -xU XDG_SESSION_DESKTOP sway

set -x TERM alacritty
set -x EDITOR nvim
set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'"
set -x FZF_DEFAULT_OPTS '--height 75% --layout=reverse --border'
set -x STARSHIP_CONFIG '/home/azmain/.config/starship/starship.toml'
# set -x CM_LAUNCHER 'rofi'

# Fzf settings
set -Ua FZF_COMPLETE 3
set -U fzf_preview_dir_cmd exa --all --color=always
set -U fzf_fd_opts --hidden --exclude=.git

# paths
set -Ua fish_user_paths $HOME/bin $HOME/latex-bin $HOME/menu-scripts $HOME/.local/bin $HOME/.cargo/bin $fish_user_path

# Arch Linux
abbr pacman "sudo pacman"
abbr aur pikaur
abbr pi "sudo pacman -Syu"
abbr pr "sudo pacman -Rs"

# Debian Linux
abbr nala "sudo nala"
abbr apt "sudo apt"
abbr nup "sudo nala upgrade"
abbr aup "sudo apt update && sudo apt upgrade"
abbr nin "sudo nala install"
abbr ain "sudo apt install"
abbr arm "sudo apt remove"
abbr nrm "sudo nala remove"
abbr atr "sudo apt autoremove"

# Fedora Linux
abbr du "sudo dnf upgrade"
abbr di "sudo dnf install"
abbr dr "sudo dnf remove"
abbr ds "dnf search"
abbr dnf "sudo dnf"

# Git
abbr ga "git add"
abbr gcl "git clone"
abbr gcm "git commit"
abbr gph "git push"
abbr gpl "git pull"

abbr vf 'nvim $(fzf --height 75% --layout=reverse --border --preview "bat --style=numbers --color=always --line-range :500 {}" )'
abbr ofc "nvim ~/.config/fish/config.fish"
abbr sfc "source ~/.config/fish/config.fish"
abbr spdl "spotdl --bitrate=320k"
abbr scenv "source ~/.venv-codding/bin/activate.fish"
abbr movies "cd /mnt/media/video/movies/"
abbr vsong "cd /mnt/media/video/songs/"
abbr ocf "cd /mnt/docs/codding-and-programming/"
abbr tx "TERM=xterm-256color tmux"
abbr sd "cd (fdfind . --type directory | fzf --height 50% --layout=reverse --border )"

alias cls clear
alias .. "cd .."
alias ls "exa -aF --icons --color=always --group-directories-first"
alias ll "exa -alF --icons --color=always --group-directories-first"
alias tree "exa -F --icons --color=always --tree"
alias vim nvim
alias nivm nvim
alias v nvim
alias book "cd /mnt/docs/Book"
alias music "cd /mnt/media/Music"
alias video "cd /mnt/media/video"
alias config '/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'

# Merge Xresources
alias merge 'xrdb -merge ~/.Xresources'


# Functions

# chande diractory
function sd
    cd (fdfind . --type directory | fzf )
end
function rd
    cd (z --list | awk '{ print $NF }' | fzf )
end

# neovim stuff
function ovc
    cd $HOME/.config/nvim/
    nvim .
end

function odf
    set -l dotfiledir "$HOME/.dotfiles/"
    set -l dir (fdfind . $dotfiledir -t d --hidden | fzf)
    if [ "$dir" = "" ]
        echo "choose directory"
    else if [ "$dir" = " " ]
        echo "choose directory"
    else
        cd $dir
        nvim .
    end
end

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
    ) && echo "opening $file" && open "$file"
end

neofetch

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# starship init fish | source
# oh-my-posh init fish --config $HOME/.config/oh-my-posh/my-oh-my-posh-gruvboc.omp.json | source

# fish_vi_key_bindings
fish_default_key_bindings
# Envioment variables
set -g fish_prompt_pwd_dir_length 0
set -x TERM "xterm-256color"
set -x EDITOR nvim
set -x MANPAGER "less"
# set -x FZF_DEFAULT_OPTS '--height 75% --layout=reverse --border'
set -x FZF_DEFAULT_OPTS ''
set -x STARSHIP_CONFIG '/home/azmain/.config/starship/starship.toml'
# set -x CM_LAUNCHER 'rofi'
set -x PF_INFO 'ascii title os kernel shell uptime palette'

# Fzf settings
set -Ua FZF_COMPLETE 3
set -U fzf_preview_dir_cmd exa --all --color=always
set -U fzf_fd_opts --hidden --exclude=.git

# paths
set -U fish_user_paths $HOME/bin $HOME/latex-bin $HOME/menu-scripts $HOME/.local/bin $HOME/.cargo/bin $HOME/miniconda3/bin $fish_user_path

# ABBR
abbr cls clear
abbr ll "exa -alF --color=always --group-directories-first"
abbr ls "exa -aF --color=always --group-directories-first"
abbr tree "exa -F --color=always --tree"
abbr sd "cd (fd . --type directory | fzf )"

abbr code codium
abbr spdl "spotdl --bitrate=320k" 
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
abbr p "sudo pacman"

abbr vf 'nvim (fzf --height 75% --layout=reverse --border --preview "bat --style=numbers --color=always --line-range :500 {}" )'

#neofetch

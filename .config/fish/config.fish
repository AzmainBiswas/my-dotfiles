if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

# starship init fish | source
# oh-my-posh init fish --config $HOME/.config/oh-my-posh/my-oh-my-posh-gruvboc.omp.json | source
thefuck --alias | source

# Envioment variables
set -x EDITOR nvim
set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'"
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
set -Ua fish_user_paths $HOME/bin $HOME/latex-bin $HOME/menu-scripts $HOME/.local/bin $HOME/.cargo/bin $fish_user_path

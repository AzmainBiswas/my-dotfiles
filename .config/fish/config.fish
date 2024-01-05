if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

starship init fish | source
# oh-my-posh init fish --config $HOME/.config/oh-my-posh/my-oh-my-posh-gruvboc.omp.json | source

# Envioment variables
set -g fish_prompt_pwd_dir_length 0
set -x TERM "xterm-256color"
set -x EDITOR nvim
set -x MANPAGER "less"
# set -x FZF_DEFAULT_OPTS '--height 75% --layout=reverse --border'
set -x FZF_DEFAULT_OPTS ''
set -x FZF_DEFAULT_COMMAND 'fdfind --strip-cwd-prefix --hidden --follow --exclude .git'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_ALT_C_COMMAND "fdfind --type d --strip-cwd-prefix --hidden --follow --exclude .git"

set -x STARSHIP_CONFIG '/home/azmain/.config/starship/starship.toml'
# set -x CM_LAUNCHER 'rofi'
set -x PF_INFO 'ascii title os kernel shell uptime palette'

# Fzf settings
set -Ua FZF_COMPLETE 3

# paths
set -Ua fish_user_paths $HOME/bin $HOME/latex-bin $HOME/menu-scripts $HOME/.local/bin $HOME/.cargo/bin $HOME/miniconda3/bin $HOME/Documents/fetch-tools $fish_user_path

# ABBR
abbr cls clear
abbr ll "exa -alF --color=always --group-directories-first"
abbr ls "exa -aF --color=always --group-directories-first"
abbr tree "exa -F --color=always --tree"
abbr sd "cd (fd . --type directory | fzf )"
abbr sfc "source ~/.config/fish/config.fish"


abbr code codium
abbr spdl "spotdl --bitrate=320k" 
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"

## firefox 
if [ "$XDG_SESSION_TYPE" = "wayland" ]
    set -Ua MOZ_ENABLE_WAYLAND 1
end

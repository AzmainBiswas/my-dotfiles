function vf
    nvim $(fzf --height 75% --layout=reverse --border --preview "bat --style=numbers --color=always --line-range :500 {}" ) $argv
end

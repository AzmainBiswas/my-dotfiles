export PATH=$HOME/.local/bin:$HOME/bin:$HOME/latex-bin:$HOME/menu-scripts:$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export EDITOR=nvim
export TERM=screen-256color
export FZF_DEFAULT_OPTS='--height 70% --layout=reverse --border'
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export media=/mnt/media
export docs=/mnt/docs
export book=/mnt/docs/Book

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway

if [ -e /home/azmain/.nix-profile/etc/profile.d/nix.sh ]; then . /home/azmain/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

#env
if test -z "$XDG_CONFIG_HOME"
set -gx XDG_CONFIG_HOME "$HOME/.config"
end

if test -z "$XDG_DATA_HOME"
set -gx XDG_DATA_HOME "$HOME/.local/share"
end

if test -z "$XDG_DATA_DIRS"
set -gx XDG_DATA_DIRS "$XDG_DATA_HOME:/usr/local/share:/usr/share"
end

if test -z "$XDG_STATE_HOME"
set -gx XDG_STATE_HOME "$HOME/.local/state"
end

if test -z "$XDG_CACHE_HOME"
set -gx XDG_CACHE_HOME "$HOME/.cache"
end

if test -z "$XDG_DESKTOP_DIR"
set -gx XDG_DESKTOP_DIR "$HOME/Desktop"
end

if test -z "$XDG_DOWNLOAD_DIR"
set -gx XDG_DOWNLOAD_DIR "$HOME/Downloads"
end

if test -z "$XDG_PUBLICSHARE_DIR"
set -gx XDG_PUBLICSHARE_DIR "$HOME/Public"
end

if test -z "$XDG_DOCUMENTS_DIR"
set -gx XDG_DOCUMENTS_DIR "$HOME/Documents"
end

if test -z "$XDG_MUSIC_DIR"
set -gx XDG_MUSIC_DIR "$HOME/Music"
end

if test -z "$XDG_PICTURES_DIR"
set -gx XDG_PICTURES_DIR "$HOME/Pictures"
end

if test -z "$XDG_VIDEOS_DIR"
set -gx XDG_VIDEOS_DIR "$HOME/Videos"
end

#for scripts
fish_add_path $HOME/.local/bin$PATH

#check for starship, init starship on fish start
if type -q starship
	starship init fish | source
end

#aliases
# -1 flag is one line, -a is all files/dirs, -F is specify dirs vs files
alias c='clear'

alias ll='eza -lh -a -F --icons=auto'
alias ls="eza -1 -a -F --icons=auto"
alias lst='eza -T --icons=auto'

alias g='gitui'

alias n='nvim'

abbrv mkdir='mkdir -p'
abbrv cp='cp -r'


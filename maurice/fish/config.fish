#env
#defaults handled by fish lol

#for scripts
fish_add_path $HOME/.local/bin$PATH

#check for starship, init starship on fish start
#if type -q starship
starship init fish | source
#end

#aliases
# -1 flag is one line, -a is all files/dirs, -F is specify dirs vs files
alias c='clear'

alias ll='eza -lh -a -F --icons=auto'
alias ls="eza -1 -a -F --icons=auto"
alias lst='eza -T --icons=auto'

alias g='gitui'

alias n='nvim'

abbr mkdir 'mkdir -p'
abbr cp 'cp -r'

set fish_greeting "hewwo >w<"

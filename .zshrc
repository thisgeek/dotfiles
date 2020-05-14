# Do everything bash used to do
source $HOME/.bash_profile

# Load homebrew's zsh completion plugins
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit

# Bind Ctrl-R to reverse history search
# Ref: https://unix.stackexchange.com/a/30169/17796
# Remember that vi edit mode defaults to / or ? while in input mode
# But Ctrl-R is easier to type quickly than stretching for the esc key
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

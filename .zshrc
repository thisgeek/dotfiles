# Do everything bash used to do
source $HOME/.bash_profile

# Load homebrew's zsh completion plugins
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit

# Bind Ctrl-R to reverse history search
# Ref: https://unix.stackexchange.com/a/30169/17796
# Remember that vi edit mode defaults to / or ? while in input mode
# But Ctrl-R is easier to type quickly than stretching for the esc key
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

PROMPT="%1~ > "

# Initialize chromium from shell (in order to take advantage of options)
# Alt: https://stackoverflow.com/questions/26388405/chrome-disable-ssl-checking-for-sites#comment96711735_46702756
# Alt: Cargo cult the configurations used by selenium web driver. See link above.
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
alias chrome="open -a Google\ Chrome --args"
alias proxy-chrome="chromium --ignore-certificate-errors --ignore-urlfetcher-cert-requests --proxy-server=http://localhost:9898 --proxy-bypass-list='<-loopback>'"

# Support pgp encryption over teletype
export GPG_TTY=$(tty)

# Include fuzzy finder completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

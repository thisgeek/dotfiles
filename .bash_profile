# zsh

# Why not both?
# Consider: https://superuser.com/questions/187639/zsh-not-hitting-profile

# PATH

# Prefer homebrew installed software to the system's
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add home scripts
export PATH=$HOME/.bin:$PATH

# Prefer local project scripts to all paths
export PATH=./.bin:./bin:$PATH


# Application binaries

# Add Gimp binaries (interactive batch mode does not work as expected)
# export PATH=$PATH:/Applications/Gimp.app/Contents/Resources/bin

# Preferred editor
export EDITOR=nvim

# Go
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Private

# Load private env
if [ -f ~/.env_private ]; then \
  set -a; . ~/env_private; set a+;
fi

# Aliases

alias nv=nvim

# Other Settings

# Simplify prompt
export PS1='\W \$ '

# Add bash completion support for homebrew-managed tools
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#   . `brew --prefix`/etc/bash_completion
#   export PS1='\W $(__git_ps1 "%s ")\$ '
# fi

# Enable extended globs
# shopt -s extglob

# Set bash/zsh to vi mode
set -o vi

# Color grep
export GREP_OPTIONS='--color=auto'

# Include iterm shell integration
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

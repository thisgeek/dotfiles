# PATH

# Prefer homebrew installed software to the system's
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add npm binaries
export PATH=/usr/local/share/npm/bin:$PATH

# Add node binaries to path
#export PATH="/usr/local/opt/node@6/bin":$PATH
export NPM_ROOT=/usr/local/lib/node_modules
#export NODE_PATH="/usr/local/opt/node@6/bin/node":$NPM_ROOT

# Add pear binaries
export PATH=/usr/local/pear/bin:$PATH

# Add home scripts
export PATH=$HOME/.bin:$PATH

# Prefer local project scripts to all paths
export PATH=./.bin:./bin:$PATH

# Use homebrew's python
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Application binaries

# Add Gimp binaries (interactive batch mode does not work as expected)
export PATH=$PATH:/Applications/Gimp.app/Contents/Resources/bin

# Java

# Set the Java home to the Java Preferences default
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$JAVA_HOME/bin:$PATH


# Private

# Load API keys
if [ -f ~/.bash.keys ]; then . ~/.bash.keys; fi


# Other Settings

# Identify as a development machine
export NODE_ENV=development

# Simplify prompt
export PS1='\W \$ '

# Add bash completion support for homebrew-managed tools
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
  export PS1='\W $(__git_ps1 "%s ")\$ '
fi

# Enable extended globs
shopt -s extglob

# Set bash to vi mode
set -o vi

# Color grep
export GREP_OPTIONS='--color=auto'

# Include iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

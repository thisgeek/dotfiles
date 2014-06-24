# PATH

# Prefer homebrew installed software to the system's
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add npm binaries
export PATH=/usr/local/share/npm/bin:$PATH

# Add node binaries to path
export NPM_ROOT=/usr/local/lib/node_modules
export NODE_PATH=/usr/local/bin/node:$NPM_ROOT

# Add pear binaries
export PATH=/usr/local/pear/bin:$PATH

# Prefer locally installed npm packages to globals
export PATH=./node_modules/.bin:$PATH

 # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin

# Add home scripts
export PATH=$HOME/.bin:$PATH

# Prefer local project scripts to all paths
export PATH=./.bin:./bin:$PATH


# Application binaries

# Add Gimp binaries (interactive batch mode does not work as expected)
export PATH=$PATH:/Applications/Gimp.app/Contents/Resources/bin

# Java

# Set the Java home to the Java Preferences default
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$JAVA_HOME/bin:$PATH

# Other Settings

# Help SVN find the prefered text editor
export EDITOR='vim -f'

# Add bash completion support for git
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Help karma find phantomjs
export PHANTOMJS_BIN='/usr/local/bin/phantomjs'

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

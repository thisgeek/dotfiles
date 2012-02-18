# PATH

# Prefer homebrew installed software to the system's
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add node binaries to path
export NODE_PATH=/usr/local/bin/node

# Add pear binaries
export PATH=$PATH:/opt/pear/bin

# Application binaries

# Add Gimp binaries (interactive batch mode does not work as expected)
export PATH=$PATH:/Applications/Gimp.app/Contents/Resources/bin

# Add Chromium
export PATH=$PATH:/Applications/Chromium.app/Contents/MacOS

# Java

# Set the Java home to the Java Preferences default
# To install Java 1.5 on Lion: http://www.s-seven.net/java_15_lion
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$JAVA_HOME/bin:$PATH

# Easily switch Java versions
function javav {
    ORIG_JAVA_HOME=$JAVA_HOME;
    JAVA_HOME=$(/usr/libexec/java_home -v$1);
    PATH=$(echo $PATH | sed -e "s;${ORIG_JAVA_HOME};${JAVA_HOME};");
}

# Other Settings

# JBoss
# export JBOSS_HOME=/opt/jboss

# Help SVN find the prefered text editor
export EDITOR='vim -f'

# Add bash completion support for git
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Handy Functions

# Combine VIM split panes with the power of find
function vimf {
    DEFAULT_PATH='.'
    vim -O `find ${2-$DEFAULT_PATH} -name $1`
}

# Install and configure powerlevel9k
source  ~/dev/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'

# terminal
export CLICOLOR=1 # enables color output for ls

# aliases
source ~/.aliases
# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

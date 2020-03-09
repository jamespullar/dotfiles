#
# ZSH Config
#

export TERM="xterm-256color"

# Install and configure powerlevel9k
source  ~/dev/powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Enable tab completion
autoload -Uz compinit && compinit

# Enables color output for ls
export CLICOLOR=1

# Enable vim mode
bindkey -v

# Aliases
source ~/.aliases

#
# PATH
#

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

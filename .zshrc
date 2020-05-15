#
# ZSH Config
#

export TERM="xterm-256color"
export EDITOR="vim"

# Install and configure powerlevel9k
source ~/dev/powerlevel10k/powerlevel10k.zsh-theme

# Enable fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Enable tab completion
autoload -Uz compinit && compinit

# Enables color output for ls
export CLICOLOR=1

# Enable vim mode
bindkey -v

# Enable fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
source ~/.aliases

#
# PATH
#

export DEV_HOME=$HOME/dev

# Custom scripts
export PATH=$PATH:$DEV_HOME/dotfiles/bin

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools


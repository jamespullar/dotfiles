#
# ZSH Config
#

# export PATH=$PATH:$HOME/.rbenv/bin:/usr/local/bin:$HOME/.bin
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export TERM="xterm-kitty"
export EDITOR="vim"

# Enable oh-my-posh shell prompt
# https://ohmyposh.dev/
#
# Themes in ~/.config/oh-my-posh/themes/
# https://ohmyposh.dev/docs/themes
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/aliens.omp.json)"

# Enable fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable tab completion
autoload -Uz compinit && compinit

# Enables color output for ls
export CLICOLOR=1

# Enable vim mode
bindkey -v

# Enable fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable Fastlane autocompletion
. ~/.fastlane/completions/completion.sh

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
export JAVA_HOME=/Applications/Android\ Studio\ Preview.app/Contents/jbr/Contents/Home

# Python
# export PATH=$PATH:$HOME/Library/Python/3.9/bin
export PATH=$PATH:/opt/homebrew/bin/python3

#
# Google Cloud SDK
#

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamespullar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jamespullar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamespullar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jamespullar/google-cloud-sdk/completion.zsh.inc'; fi

#
# On Start
#

# Show a random, colorful quote on opening a new terminal
# neofetch to write out the system information
# fortune to display a random quote
# cowsay to have a cow say the quote
# lolcat to display all the text in rainbow colors

neofetch --ascii "$(fortune | cowsay -W 50)" | lolcat -ats 400

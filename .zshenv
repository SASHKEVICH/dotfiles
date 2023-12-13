# zsh
ENABLE_CORRECTION="true"

# cargo
. "$HOME/.cargo/env"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/.zsh/custom"

# PATH
export PATH="$PATH:/Users/sashkevich/Library/Python/3.9/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/Users/sashkevich/.mint/bin"
export PATH="/Users/sashkevich/.local/bin:$PATH"

# Starship
export STARSHIP_CONFIG=~/dotfiles/.config/starship/starship.toml

# Localization
export LC_ALL='en_US.UTF-8'

# Homebrew
export LIBRARY_PATH=/opt/homebrew/lib

# nvm
export NVM_DIR=~/.nvm

export EDITOR=nvim

[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/keybinds.zsh ]] && source ~/.zsh/keybinds.zsh
[[ -f ~/.zsh/nvm.zsh ]] && source ~/.zsh/nvm.zsh

zstyle ':omz:update' mode auto

# Plugins
plugins=(
	git
	zsh-autosuggestions
	you-should-use
	z
	fzf-zsh-plugin
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Load Starship
eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"
fpath+=${ZDOTDIR:-~}/.zsh_functions

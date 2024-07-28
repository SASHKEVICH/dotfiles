[[ -f ~/.zsh/custom/aliases.zsh ]] && source ~/.zsh/custom/aliases.zsh
[[ -f ~/.zsh/custom/keybinds.zsh ]] && source ~/.zsh/custom/keybinds.zsh
[[ -f ~/.zsh/custom/nvm.zsh ]] && source ~/.zsh/custom/nvm.zsh

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

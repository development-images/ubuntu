# Basic zsh configuration

# Path to your oh-my-zsh installation.
export ZSH="/home/vscode/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Auto update if required
zstyle ':omz:update' mode auto

# Auto update every 90 days
zstyle ':omz:update' frequency 90

# Enable additional plugins
plugins=(git conda-zsh-completion poetry)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable completion
autoload -U compinit && compinit

# Add pipx autocompletion
eval "$(register-python-argcomplete pipx)"

# Aliases for common commands
alias apt='sudo apt'
alias apt-get='sudo apt-get'
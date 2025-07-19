export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fwalch"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


PROMPT='%{$fg[cyan]%}%D{%T}'$PROMPT
complete -o nospace -C /usr/bin/terraform terraform

alias vim=nvim
alias python=python3
alias tf=terraform
alias cat=bat
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="$PATH:$HOME/development/flutter/bin"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

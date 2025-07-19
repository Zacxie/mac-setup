export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fwalch"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


PROMPT='%{$fg[cyan]%}%D{%T}'$PROMPT
complete -o nospace -C /usr/bin/terraform terraform

alias vim=nvim
alias python=python3
alias ffuf='/Users/zaccie/tools/ffuf/./ffuf'
alias tf=terraform
alias cat=bat
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="$PATH:/Users/zaccie/development/flutter/bin"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

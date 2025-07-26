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
alias lg=lazygit
ff() {
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}
ssh() {
    if [ -n "$TMUX" ]; then
        command ssh "$@"
        return
    fi
    
    if [[ "$1" =~ ^(-h|--help|-V|--version|-G)$ ]]; then
        command ssh "$@"
        return
    fi
    
    if [ $# -eq 0 ]; then
        echo "Usage: ssh <target>"
        return 1
    fi
    
    # Extract last argument that looks like a hostname
    local target="${@[-1]}"
    local session_name="ssh_$(echo "$target" | sed 's/[^a-zA-Z0-9._-]/_/g')"
    
    # Create a script to run in tmux
    local temp_script=$(mktemp)
    echo "#!/bin/bash" > "$temp_script"
    echo "ssh $(printf '%q ' "$@")" >> "$temp_script"
    # Remove the exec $SHELL line - session will close when SSH exits
    chmod +x "$temp_script"
    
    tmux new-session -s "$session_name" "$temp_script; rm '$temp_script'"
}
alias tmux-ls='tmux list-sessions 2>/dev/null || echo "No active tmux sessions"'
alias tmux-kill-all='tmux list-sessions -F "#{session_name}" 2>/dev/null | xargs -I {} tmux kill-session -t {}'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="$PATH:$HOME/development/flutter/bin"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"


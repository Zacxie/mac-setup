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
    # Handle help, version, and configuration testing flags
    case "$1" in
        -h|--help|-V|--version|-G|-T|-t|-q|-Q)
            command ssh "$@"
            return
            ;;
        -*)
            # For other flags, check if there's a hostname argument
            local has_hostname=false
            for arg in "$@"; do
                if [[ "$arg" != -* ]] && [[ "$arg" != *=* ]]; then
                    has_hostname=true
                    local target="$arg"
                    break
                fi
            done
            
            if [ "$has_hostname" = true ]; then
                local session_name="ssh_towards_${target}"
                tmux new-session -s "$session_name" "ssh $@"
            else
                # No hostname found, use original ssh
                command ssh "$@"
            fi
            return
            ;;
        "")
            echo "Usage: ssh <target>"
            return 1
            ;;
        *)
            # Normal hostname connection
            local target="$1"
            local session_name="ssh_towards_${target}"
            tmux new-session -s "$session_name" "ssh $@"
            ;;
    esac
}
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="$PATH:$HOME/development/flutter/bin"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"


#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install batcat
brew install git
brew install fzf
brew install aws-sam-cli
brew install awscli
brew install gdu
brew install ncdu
brew install ripgrep
brew install tmux

### Terminal
brew install neovim
brew install starship
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting
brew install zoxide

### Containers
brew install act

### Security
brew install wireshark
brew install gobuster
brew install exiftool
brew install nikto
brew install masscan
brew install hydra
brew install hashcat
brew install john
brew install neo4j

### Nice to have
brew install btop
brew install svim
brew install lazygit
brew install tlrc
brew install spotify_player
brew install docker

## zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Casks
### Terminals, IDEs & browsers
brew install --cask brave-browser
brew install --cask ghostty
brew install --cask visual-studio-code

### Containerization
brew install --cask utm
brew install --cask docker-desktop
brew install --cask orbstack

### Security
brew install --cask metasploit
brew install --cask bloodhound
brew install --cask postman
brew install --cask burp-suite

### Window manager
brew install --cask nikitabobko/tap/aerospace
brew install --cask betterdisplay

### Notes
brew install --cask obsidian

### Nice to have
brew install --cask spotify

### Fonts
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code


# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 497799835 #xCode

#Load configs
## Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles..."

## Copy .config directory if it exists
if [[ -d "$SCRIPT_DIR/.config" ]]; then
    mkdir -p "$HOME/.config"
    cp -r "$SCRIPT_DIR/.config"/* "$HOME/.config/"
    echo "Copied .config directory"
fi

## Copy all other dotfiles (excluding .config, .git, .DS_Store)
for item in "$SCRIPT_DIR"/.*; do
    basename_item=$(basename "$item")

    ## Skip unwanted items
    if [[ "$basename_item" == "." || "$basename_item" == ".." || 
          "$basename_item" == ".git" || "$basename_item" == ".DS_Store" || 
          "$basename_item" == ".config" ]]; then
        continue
    fi
    
    ## Copy to home directory
    cp -r "$item" "$HOME/"
    echo "Copied $basename_item"
done



# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection 0
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write -g NSWindowShouldDragOnGesture YES
# set default lock screen bindings to alt+shift+backspace
defaults write -g NSUserKeyEquivalents -dict-add "Lock Screen" "~$\U0008"


# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/


# Start Services
echo "Starting Services (grant permissions)..."
brew services start aerospace
brew services start sketchybar

# Exiting
echo "Installation complete...\n"

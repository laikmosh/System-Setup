#!/bin/bash

# Set default folder for storing screenshots
echo "Configuring default screenshot location..."
mkdir -p ~/Downloads # Create the directory if it doesn't exist
defaults write com.apple.screencapture location ~/Downloads

# Install fonts
echo "Installing fonts..."
cp -a ./fonts/. ~/Library/Fonts # Copy fonts to the Fonts directory

# Configure zsh autocomplete
echo "Configuring zsh autocomplete..."
touch ~/.zshrc # Create the .zshrc file if it doesn't exist
{
  echo '# Enable zsh autocomplete plugin'
  echo 'source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh' # Sourcing the autocomplete plugin
  echo 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' # Sourcing the autosuggestions plugin
} > ~/.zshrc
source ~/.zshrc # Source the updated .zshrc file

#!/bin/bash

# Install Homebrew
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages via Brewfile
echo "Installing packages from Brewfile"
brew bundle --file=./brew/Brewfile

# List of applications to modify
apps=(
    "/Applications/Figma.app"
    "/Applications/Magnet.app"
    "/Applications/Docker.app"
    "/Applications/Docker.app"
    "/Applications/zoom.us.app"
    "/Applications/CopyClip.app"
    "/Applications/WhatsApp.app"
    "/Applications/QR Capture.app"
    "/Applications/GIPHY CAPTURE.app"
    "/Applications/GitHub Desktop.app"
    "/Applications/MonitorControl.app"
    "/Applications/Affinity Photo 2.app"
    "/Applications/Visual Studio Code.app"
)

# Remove quarantine attribute and open the applications
for app in "${apps[@]}"
do
    # Remove the com.apple.quarantine attribute
    sudo xattr -dr com.apple.quarantine "$app"

    # Open the application
    open "$app"
done

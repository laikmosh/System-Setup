#!/bin/bash

# Define a function to execute before exiting
function removeTmpFiles {
    # Remove the SystemSetupTmp directory and its contents recursively
    rm -rf "$HOME/SystemSetupTmp"
    echo "Temporary files removed successfully."
}

# Register the removeTmpFiles function to be called on exit
trap removeTmpFiles EXIT

# Prompt for sudo password
echo 'Password required for installation:'
if ! sudo -v; then
    echo "Failed to obtain sudo privileges. Exiting."
    exit 1
fi

# Keep sudo credentials alive
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Download repository
mkdir -p "$HOME/SystemSetupTmp"
cd "$HOME/SystemSetupTmp" || exit

# Download repository
curl -L -o master.zip https://github.com/laikmosh/System-Setup/archive/refs/heads/main.zip
unzip -o master.zip
cd System-Setup-main || exit

# Install brew and brewfile
sh brew/install.sh

# System custom settings
sh SysSettings/setup.sh

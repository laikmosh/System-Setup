#!/bin/bash

# Prompt for sudo password, as it will be required for all the sudo commands
echo 'Password required for installation:'
if ! sudo -v; 
    then    
    echo "Failed to obtain sudo privileges. Exiting."    
    exit 1
fi

# Keep sudo credentials alive, so it doesnt keep asking for your password
while true; do    
    sudo -n true    
    sleep 60    
    kill -0 "$$" || exit
done 2>/dev/null &

# Setup a temporary folder to download the repository
mkdir -p "$HOME/SystemSetupTmp"cd "$HOME/SystemSetupTmp" || exit

# Download and unzip repository, exit script if download failed
curl -L -o master.zip https://github.com/laikmosh/System-Setup/archive/refs/heads/main.zip
unzip -o master.zip
cd System-Setup-main || exit

# Install brew and brewfile
sh brew/install.sh

# System custom settings
sh SysSettings/setup.sh

# Finally, remove the temporary directory and its contents recursively    
rm -rf "$HOME/SystemSetupTmp"    
echo "Temporary files removed successfully."
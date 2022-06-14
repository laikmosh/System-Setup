# !/bin/bash

mas "Xcode", id: 497799835
mas "Transporter", id: 1450874784

sudo xcodebuild -license accept

open /Applications/Xcode.app
xcode-select --install

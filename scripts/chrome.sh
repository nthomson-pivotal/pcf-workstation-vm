#!/bin/bash

set -e

# Install Chrome
curl -s https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list'

sudo apt update

sudo apt install -y google-chrome-stable


# Create launcher shortcut
gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | sed "s/]/,'google-chrome.desktop']/")"

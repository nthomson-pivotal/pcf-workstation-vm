#!/bin/bash

set -e

# Install Chrome
curl -s https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list'

sudo apt update

sudo apt install -y google-chrome-stable


# Create launcher shortcut
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "$(dbus-launch gsettings get com.canonical.Unity.Launcher favorites | sed "s/]/,'google-chrome.desktop']/")"

# Install some bookmarks
mkdir -p ~/.config/google-chrome/Default

cp /tmp/assets/chrome-bookmarks ~/.config/google-chrome/Default/Bookmarks
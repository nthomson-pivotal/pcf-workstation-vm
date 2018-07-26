#!/bin/bash

set -e

LOGO_URL="https://assets.brandfolder.com/ohxttd-7yxa60-clvf50/original/Pivotal_TealOnWhite_RGB.png"

# Install Ubuntu desktop
sudo apt install -y --no-install-recommends ubuntu-desktop unity-lens-applications unity-lens-files indicator-session

# Install RDP
sudo apt install -y xrdp
sudo systemctl enable xrdp

# Grab logo and configure desktop background
mkdir ~/background

wget -O ~/background/logo.png $LOGO_URL

gsettings set org.gnome.desktop.background picture-uri "file:///home/pivotal/background/logo.png"
gsettings set org.gnome.desktop.background picture-options "centered"
gsettings set org.gnome.desktop.background primary-color "#ffffffffffff"

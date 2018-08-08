#!/bin/bash

set -e

LOGO_URL="https://assets.brandfolder.com/ohxttd-7yxa60-clvf50/original/Pivotal_TealOnWhite_RGB.png"

# Install Ubuntu desktop
sudo apt install -y --no-install-recommends ubuntu-desktop unity-lens-applications unity-lens-files indicator-session gnome-terminal

# Install RDP
sudo apt install -y xrdp
sudo systemctl enable xrdp

# Grab logo and configure desktop background
mkdir ~/background

wget -q -O ~/background/logo.png $LOGO_URL

dbus-launch gsettings set org.gnome.desktop.background picture-uri "file:///home/pivotal/background/logo.png"
dbus-launch gsettings set org.gnome.desktop.background picture-options "centered"
dbus-launch gsettings set org.gnome.desktop.background primary-color "#ffffffffffff"

# Fix gnome-terminal crashing immediately
sudo localectl set-locale LANG="en_US.UTF-8"
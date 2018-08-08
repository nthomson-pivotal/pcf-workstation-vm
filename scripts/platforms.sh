#!/bin/bash

set -e

STS_VERSION=3.9.5.RELEASE
NODEJS_MAJOR_VERSION=10
DOT_NET_SDK_VERSION=2.1.200

# Install JDK and Maven
sudo apt install -y openjdk-8-jdk maven

# Install Spring Tool Suite
wget -q https://download.springsource.com/release/STS/$STS_VERSION/dist/e4.8/spring-tool-suite-$STS_VERSION-e4.8.0-linux-gtk-x86_64.tar.gz
tar zxf spring-tool-suite-$STS_VERSION-e4.8.0-linux-gtk-x86_64.tar.gz
rm spring-tool-suite-$STS_VERSION-e4.8.0-linux-gtk-x86_64.tar.gz

sudo bash -c 'cat >/usr/share/applications/STS.desktop' <<EOF
[Desktop Entry]
Name=SpringSource Tool Suite
Comment=SpringSource Tool Suite
Exec=/home/pivotal/sts-bundle/sts-$STS_VERSION/STS
Icon=/home/pivotal/sts-bundle/sts-$STS_VERSION/icon.xpm
StartupNotify=true
Terminal=false
Type=Application
Categories=Development;IDE;Java;
EOF

# Create launcher shortcut
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "$(dbus-launch gsettings get com.canonical.Unity.Launcher favorites | sed "s/]/,'STS.desktop']/")"

# Install Golang
sudo apt install -y golang-go

mkdir ~/gocode

echo 'GOPATH=~/gocode' >> .bashrc

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_$NODEJS_MAJOR_VERSION.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install .NET core
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt update
sudo apt install -y dotnet-sdk-$DOT_NET_SDK_VERSION

## Note: VSCode is installed in tools.sh
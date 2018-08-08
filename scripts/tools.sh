#!/bin/bash

set -e

OM_VERSION=0.38.0
PIVNET_CLI_VERSION=0.0.52
FLY_VERSION=3.14.1
TERRAFORM_VERSION=0.11.7
GOVC_VERSION=0.18.0

# APT packages
sudo apt install -y \
    ca-certificates \
    build-essential \
    curl \
    wget \
    dnsutils \
    unzip \
    git \
    jq \
    python \
    python-pip \
    httpie \
    aria2 \
    ntpdate \
    terminator



# Customize Terminator
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
mkdir -p ~/.config/terminator
cp /tmp/assets/terminator.config ~/.config/terminator/config

# Terminator shortcut
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "$(dbus-launch gsettings get com.canonical.Unity.Launcher favorites | sed "s/]/,'terminator.desktop']/")"

# Install CF CLI
curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx && \
  sudo mv cf /usr/local/bin && \
  sudo chmod +x /usr/local/bin/cf

sudo curl -o /usr/share/bash-completion/completions/cf https://raw.githubusercontent.com/cloudfoundry/cli/master/ci/installers/completion/cf

# Install OM CLI
wget -q https://github.com/pivotal-cf/om/releases/download/$OM_VERSION/om-linux && \
  sudo mv om-linux /usr/local/bin/om && \
  sudo chmod +x /usr/local/bin/om

# Install Pivnet CLI
wget -q https://github.com/pivotal-cf/pivnet-cli/releases/download/v$PIVNET_CLI_VERSION/pivnet-linux-amd64-$PIVNET_CLI_VERSION && \
  sudo mv pivnet-linux-amd64-$PIVNET_CLI_VERSION /usr/local/bin/pivnet && \
  sudo chmod +x /usr/local/bin/pivnet

# Install fly CLI
wget -q https://github.com/concourse/concourse/releases/download/v$FLY_VERSION/fly_linux_amd64 && \
  sudo mv fly_linux_amd64 /usr/local/bin/fly && \
  sudo chmod +x /usr/local/bin/fly

# Install Terraform
wget -q -O terraform.zip https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip && \
  sudo mv terraform /usr/local/bin/terraform && \
  sudo chmod +x /usr/local/bin/terraform && \
  rm terraform.zip

# Install speedtest
pip install speedtest-cli

# Install NTP server
sudo apt install -y ntp

# Install VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt update

sudo apt install -y code

## Installing VS Code was erroring about a dependency 'libXss.so'
sudo apt install -y libgtk2.0-0 libxss1 libasound2

## Install some VS Code extensions
code --install-extension mauve.terraform
code --install-extension shakram02.bash-beautify
code --install-extension PeterJausovec.vscode-docker
code --install-extension vscjava.vscode-java-pack
code --install-extension Pivotal.vscode-boot-dev-pack
code --install-extension robertohuertasm.vscode-icons
code --install-extension eamodio.gitlens

# Create launcher shortcut
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "$(dbus-launch gsettings get com.canonical.Unity.Launcher favorites | sed "s/]/,'code.desktop']/")"

# Install Apache Bench
sudo apt install -y apache2-utils

# Install govc
wget -q https://github.com/vmware/govmomi/releases/download/v$GOVC_VERSION/govc_linux_amd64.gz && \
  gunzip govc_linux_amd64.gz && \
  sudo mv govc_linux_amd64 /usr/local/bin/govc && \
  sudo chmod +x /usr/local/bin/govc

# Install kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl
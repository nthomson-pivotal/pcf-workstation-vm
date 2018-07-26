#!/bin/bash

set -e

# Add user to sudoers.
echo "$JUMPBOX_USERNAME        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Configure APT
apt update
apt full-upgrade -y

apt install -y \
    apt-transport-https \
    curl \
    software-properties-common

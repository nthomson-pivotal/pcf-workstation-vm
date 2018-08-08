#!/bin/bash

set -e

if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
  echo "Skipping VirtualBox guest additions"
  exit 0
fi

# Mount the disk image
cd /tmp
sudo mkdir /tmp/isomount
sudo mount -t iso9660 -o loop /tmp/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
# Note: This swallows error messages due to 'modprobe vboxsf failed' error
sudo /tmp/isomount/VBoxLinuxAdditions.run || : 

# Cleanup
sudo umount isomount
sudo rm -rf isomount /tmp/VBoxGuestAdditions.iso
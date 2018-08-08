#!/bin/bash -eux

set -e

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  echo "Skipping VMWare Tools"
  exit 0
fi

sudo apt -y install open-vm-tools
sudo mkdir -p /mnt/hgfs

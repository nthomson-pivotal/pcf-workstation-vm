#!/bin/bash

set -e

if [ -z "$PIVNET_TOKEN" ]; then
  echo "Warning: Pivnet token not set, skipping Pivotal bits"
  exit
fi

OM_VERSION=2.1.10

mkdir ~/pivotal-bits

pivnet login --api-token $PIVNET_TOKEN

pivnet download-product-files -p ops-manager -r $OM_VERSION -g "*.ova" -d ~/pivotal-bits

pivnet logout

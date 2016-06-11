#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


echo "create lvm nfsd volumes ..."
lvcreate -L 5G -n kubernetes-data system

echo "format nfsd volume ..."
wipefs /dev/system/kubernetes-data
mkfs.ext4 -F /dev/system/kubernetes-data




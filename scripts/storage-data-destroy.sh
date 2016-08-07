#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


echo "remove lvm data volumes for worker kubernetes"
lvremove /dev/system/kubernetes-data




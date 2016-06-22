#!/bin/bash

set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

${SCRIPT_ROOT}/virsh-destroy.sh
${SCRIPT_ROOT}/virsh-undefine.sh

echo "remove lvm volumes ..."

lvremove /dev/system/kubernetes
lvremove /dev/system/kubernetes-docker
lvremove /dev/system/kubernetes-kubelet


echo "done"

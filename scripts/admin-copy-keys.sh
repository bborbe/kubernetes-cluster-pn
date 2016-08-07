#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p ~/.kube/pn

scp bborbe@sun.pn.benjamin-borbe.de:/var/lib/libvirt/images/kubernetes/scripts/ca.pem ~/.kube/pn/
scp bborbe@sun.pn.benjamin-borbe.de:/var/lib/libvirt/images/kubernetes/scripts/admin.pem ~/.kube/pn/
scp bborbe@sun.pn.benjamin-borbe.de:/var/lib/libvirt/images/kubernetes/scripts/admin-key.pem ~/.kube/pn/

#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


echo "create virsh kubernetes mac=00:16:3e:2f:90:0a ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 2000 \
--vcpus 4 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes \
--disk /dev/system/kubernetes,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-data,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=br0,mac=00:16:3e:2f:90:0a,model=virtio


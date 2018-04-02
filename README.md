# Kubernetes Cluster Configuration

## Update cluster

```
ssh sun.pn.benjamin-borbe.de
sudo -s
cd /var/lib/libvirt/images/kubernetes
git pull
virsh destroy kubernetes
virsh start kubernetes
```

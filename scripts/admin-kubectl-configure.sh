#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p $HOME/.kube/pn
kubectl config set-cluster pn-cluster --server=https://172.16.90.10:443 --certificate-authority=$HOME/.kube/pn/ca.pem
kubectl config set-credentials pn-admin --certificate-authority=$HOME/.kube/pn/ca.pem --client-key=$HOME/.kube/pn/admin-key.pem --client-certificate=$HOME/.kube/pn/admin.pem
kubectl config set-context pn-system --cluster=pn-cluster --user=pn-admin
kubectl config use-context pn-system

echo "test with 'kubectl get nodes'"

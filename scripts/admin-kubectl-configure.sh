#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p $HOME/.kube/sun
kubectl config set-cluster sun-cluster --server=https://172.16.72.10:443 --certificate-authority=$HOME/.kube/sun/ca.pem
kubectl config set-credentials sun-admin --certificate-authority=$HOME/.kube/sun/ca.pem --client-key=$HOME/.kube/sun/admin-key.pem --client-certificate=$HOME/.kube/sun/admin.pem
kubectl config set-context sun-system --cluster=sun-cluster --user=sun-admin
kubectl config use-context sun-system

echo "test with 'kubectl get nodes'"

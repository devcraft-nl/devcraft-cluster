#!/bin/bash

helm install flux-operator oci://ghcr.io/controlplaneio-fluxcd/charts/flux-operator \
  --namespace flux-system \
  --create-namespace

export KEY_FP=4527EAAAEF676E9D3802CB489BCD8CD0C1B5A8CE

gpg --export-secret-keys --armor "${KEY_FP}" |
kubectl create secret generic sops-gpg \
--namespace=flux-system \
--from-file=sops.asc=/dev/stdin

kubectl apply -f flux/flux-instance-prod.yaml
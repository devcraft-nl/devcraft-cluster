#!/bin/bash

kind create cluster -n devcraft-local --config local-cluster-config.yaml

kubectl cluster-info --context kind-devcraft-local

helm install flux-operator oci://ghcr.io/controlplaneio-fluxcd/charts/flux-operator \
  --namespace flux-system \
  --create-namespace

export KEY_FP=C2C715BB173803D1A33C0B9E64D72306B5CEADB8

gpg --export-secret-keys --armor "${KEY_FP}" |
kubectl create secret generic sops-gpg \
--namespace=flux-system \
--from-file=sops.asc=/dev/stdin

kubectl apply -f flux/flux-instance-local.yaml
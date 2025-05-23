#!/bin/bash

helm install flux-operator oci://ghcr.io/controlplaneio-fluxcd/charts/flux-operator \
  --namespace flux-system \
  --create-namespace

kubectl apply -f flux/flux-instance-prod.yaml
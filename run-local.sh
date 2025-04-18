#!/bin/bash

kind create cluster -n devcraft-local

kubectl cluster-info --context kind-devcraft-local

helm install flux-operator oci://ghcr.io/controlplaneio-fluxcd/charts/flux-operator \
  --namespace flux-system \
  --create-namespace

kubectl apply -f flux/flux-instance-local.yaml
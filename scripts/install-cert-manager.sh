#!/usr/bin/env bash

kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v0.15.1/cert-manager.yaml

TIMEOUT="60s"
echo "Will wait for ${TIMEOUT} for the cert-manager deployments before continuining"

# Wait until the deployments are available before continuining
kubectl wait \
    --timeout=${TIMEOUT} \
    --for=condition=available \
    deployment.apps \
    -l app.kubernetes.io/instance=cert-manager \
    -n cert-manager
#!/usr/bin/env bash

TIMEOUT="60s"

echo "# Installing cert-manager"
kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v0.15.1/cert-manager.yaml
echo

echo "# Ensure the cert-manager deployments are ready before continuining. Will wait ${TIMEOUT}"
kubectl wait \
    --timeout=${TIMEOUT} \
    --for=condition=available \
    deployment.apps \
    -l app.kubernetes.io/instance=cert-manager \
    -n cert-manager
echo

# Issuers
echo "# Installing LetsEncrypt issuers"
kubectl apply -f k8s/issuer/staging.yaml
kubectl apply -f k8s/issuer/production.yaml
echo

echo "# Ensure the LetsEncrypt staging issuer is ready before continuining. Will wait ${TIMEOUT}"
kubectl wait \
    --timeout=${TIMEOUT} \
    --for=condition=ready \
    clusterissuer.cert-manager.io/letsencrypt-staging
echo

echo "# Ensure the LetsEncrypt production issuer is ready before continuining. Will wait ${TIMEOUT}"
kubectl wait \
    --timeout=${TIMEOUT} \
    --for=condition=ready \
    clusterissuer.cert-manager.io/letsencrypt-production
echo
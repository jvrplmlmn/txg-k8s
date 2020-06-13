#!/usr/bin/env bash
set -euo pipefail

TIMEOUT="60s"

echo "# Create the namespace"
kubectl apply -f k8s/namespace.yaml
echo

echo "# Deploy the application"
kubectl apply -f k8s/greeter-tamedia/deployment.yaml
kubectl apply -f k8s/greeter-tamedia/service.yaml
echo

echo "# Ensure the greeter-tamedia deployment and service is ready before continuining. Will wait ${TIMEOUT}"
kubectl wait \
    --timeout=${TIMEOUT} \
    --for=condition=available \
    deployment.apps \
    -l app.kubernetes.io/name=greeter-tamedia \
    -n example
echo

echo "# Create the ingress resource"
kubectl apply -f k8s/ingress/example_dot_com.yaml
echo
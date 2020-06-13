#!/usr/bin/env bash
set -euo pipefail

minikube delete

if [[ "$OSTYPE" == "darwin"* ]]; then
    bash scripts/_minikube-down-ingress-dns-osx.sh
else
    bash scripts/_minikube-down-ingress-dns-other.sh
fi

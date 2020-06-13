#!/usr/bin/env bash
set -euo pipefail

minikube delete

if [[ "$OSTYPE" == "darwin"* ]]; then
    bash scripts/minikube/down-ingress-dns-osx.sh
else
    bash scripts/minikube/down-ingress-dns-other.sh
fi

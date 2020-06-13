#!/usr/bin/env bash
set -euo pipefail

minikube start

# Addon: Dashboard
minikube addons enable dashboard

# Addon: Nginx ingress controller
minikube addons enable ingress

# Addon: DNS service for ingress controllers
minikube addons enable ingress-dns

# Additional scripts specific for a OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    bash scripts/minikube/up-ingress-dns-osx.sh
else
    bash scripts/minikube/up-ingress-dns-other.sh
fi

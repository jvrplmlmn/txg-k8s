#!/usr/bin/env bash
set -euo pipefail

echo "Setting up the additonal resolver config for ingress-dns"

FILE="/etc/resolver/minikube-example_dot_com"
echo "Creating the file ${FILE} requires sudo"

mkdir -p /etc/resolver
cat <<EOF | sudo tee ${FILE}
domain example.com
nameserver $(minikube ip)
search_order 1
timeout 5
EOF

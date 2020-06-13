#!/usr/bin/env bash
set -euo pipefail

echo "# Create the ingress resource"
kubectl apply -f k8s/ingress/example_dot_com.yaml
echo

__ingress_warning="# The ingress might not be immediately available.
# The Nginx ingress controller needs to reconcile its state.
# Additionally, since we are configuring TLS, a certificate needs
# to be requested and provisioned.
#
# Unfortunately we cannot run kubectl wait on this resource to ensure
# that it is available/ready, so be warned before testing."

echo "$__ingress_warning"
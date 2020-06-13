#!/usr/bin/env bash
set -euo pipefail

bash scripts/provision/cert-manager.sh
bash scripts/provision/application.sh
bash scripts/provision/ingress.sh
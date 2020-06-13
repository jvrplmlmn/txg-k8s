#!/usr/bin/env bash
set -euo pipefail

for f in minikube-example_dot_com
do
    FILE="/etc/resolver/${f}"
    if [[ -f "$FILE" ]]
    then
        echo "Deleting the file ${FILE} requires sudo"
        sudo rm ${FILE}
    fi
done


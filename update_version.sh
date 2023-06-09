#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$SCRIPT_DIR"

version="$1"

if [ "${GITHUB_ACTIONS:-false}" == "true" ] ; then
  # self-bootstrap inside another action, maybe install python here?
  sudo apt-get install -y jq
fi

config_file='config.json'
jq -r ".Version|=\"${version}\"" "$config_file" > tmpfile
mv tmpfile "$config_file"


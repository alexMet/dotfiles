#!/usr/bin/env bash
set -euo pipefail

# Run aws cli with session manager inside a container
podman run --rm -it -v ~/.aws:/root/.aws awscli-with-session "$@"

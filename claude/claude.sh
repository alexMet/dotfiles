#!/usr/bin/env bash
set -euo pipefail

# Build the image with: podman build -t claude-sandbox .
# Copy the script: cp -f claude.sh /usr/local/bin/claude
# Run with: claude

mkdir -p "$HOME/.claude"
touch "$HOME/.claude.json"

HOST_UID="$(id -u)"
HOST_GID="$(id -g)"

exec podman run --rm -it \
  --userns=keep-id:uid=$HOST_UID,gid=$HOST_GID \
  --user "$HOST_UID:$HOST_GID" \
  -e HOME=/ \
  -v "$PWD:/work:rw" \
  -v "$HOME/.claude:/.claude:rw" \
  -v "$HOME/.claude.json:/.claude.json:rw" \
  --network=bridge \
  --hostname claude-sandbox \
  claude-sandbox "$@"


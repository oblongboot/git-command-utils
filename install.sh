#!/bin/bash

set -e
echo "Installing git cloneall!"

TARGET="$(git --exec-path)/git-cloneall"

if [ "$EUID" -ne 0 ]; then
  echo "Run with doas/sudo."
  exit 1
fi

chmod +x git-cloneall
install -m 0755 git-cloneall "$TARGET"

echo "Installed to: $TARGET"
echo "Now you can run: git cloneall <org>"
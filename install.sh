#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Error: Run with doas/sudo."
  exit 1
fi

TARGET_DIR="$(git --exec-path)"

echo "What would you like to install?"
echo "1) git-cloneall"
echo "2) git-quickpush"
echo "3) All utilities"
read -p "Enter choice [1-3]: " CHOICE

install_tool() {
    local tool=$1
    if [ -f "$tool" ]; then
        chmod +x "$tool"
        install -m 0755 "$tool" "$TARGET_DIR/$tool"
        echo "Installed: $TARGET_DIR/$tool"
    else
        echo "Error: File '$tool' not found in current directory."
    fi
}

case $CHOICE in
  1)
    install_tool "git-cloneall"
    ;;
  2)
    install_tool "git-quickpush"
    ;;
  3)
    install_tool "git-cloneall"
    install_tool "git-quickpush"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

echo "Done! You can now use the commands as 'git <toolname>'"

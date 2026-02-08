#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

command -v stow >/dev/null 2>&1 || {
  echo "GNU Stow is required. Install it and re-run." >&2
  exit 1
}

command -v yay >/dev/null 2>&1 || {
  echo "This script expects yay. Install yay first or edit bin/setup.sh to use another helper." >&2
  exit 1
}

cd "$REPO_DIR"

echo "Restowing hypr and bashrc configs..."
stow --restow hypr bashrc

echo "Copying gruvbox wallpaper into Omarchy theme..."
install -Dm644 backgrounds/2-gruvbox.jpg \
  "$HOME/.config/omarchy/themes/gruvbox/backgrounds/2-gruvbox.jpg"

packages=(brave-bin yt-dlp gvfs-dnssd)

echo "Installing required packages via yay (${packages[*]})..."
yay -S --needed "${packages[@]}"

cat <<'EOF'

Setup complete. Hyprland configs are linked, wallpaper copied, and packages synced.
EOF

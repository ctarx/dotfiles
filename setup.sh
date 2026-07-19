#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE="${1:-}"

if [[ -t 1 ]]; then
  BLUE=$'\033[1;34m'
  GREEN=$'\033[1;32m'
  YELLOW=$'\033[1;33m'
  RED=$'\033[1;31m'
  RESET=$'\033[0m'
else
  BLUE=""
  GREEN=""
  YELLOW=""
  RED=""
  RESET=""
fi

info() {
  printf '%s==>%s %s\n' "$BLUE" "$RESET" "$1"
}

notice() {
  printf '%s  ->%s %s\n' "$YELLOW" "$RESET" "$1"
}

success() {
  printf '%s[OK]%s %s\n' "$GREEN" "$RESET" "$1"
}

error() {
  printf '%sError:%s %s\n' "$RED" "$RESET" "$1" >&2
  exit 1
}

case "$PROFILE" in
  desktop)
    OTHER_PROFILE="laptop"
    PROFILE_CONFIG="$HOME/.config/hypr/hyprland.conf"
    PROFILE_SOURCE="$REPO_DIR/desktop/.config/hypr/hyprland.conf"
    PROFILE_BASHRC_SOURCE="$REPO_DIR/desktop/.bashrc"
    ;;
  laptop)
    OTHER_PROFILE="desktop"
    PROFILE_CONFIG="$HOME/.config/hypr/hyprland.lua"
    PROFILE_SOURCE="$REPO_DIR/laptop/.config/hypr/hyprland.lua"
    PROFILE_BASHRC_SOURCE="$REPO_DIR/laptop/.bashrc"
    ;;
  *)
    error "Usage: ./setup.sh <desktop|laptop>"
    ;;
esac

command -v git >/dev/null 2>&1 || error "Git is not installed"
command -v stow >/dev/null 2>&1 || error "GNU Stow is not installed"

cd "$REPO_DIR"

link_points_to() {
  [[ -L "$1" ]] &&
    [[ "$(readlink -f "$1")" == "$(readlink -f "$2")" ]]
}

ALREADY_STOWED=false
if link_points_to "$HOME/.bashrc" "$PROFILE_BASHRC_SOURCE" &&
  link_points_to "$PROFILE_CONFIG" "$PROFILE_SOURCE"; then
  ALREADY_STOWED=true
fi

REPO_DIRTY=false
if [[ -n "$(git status --porcelain)" ]]; then
  REPO_DIRTY=true
fi

if ! $ALREADY_STOWED && $REPO_DIRTY; then
  error "The repository has uncommitted changes. Commit or discard them before the first installation."
fi

info "Selected profile: $PROFILE"

info "Removing the $OTHER_PROFILE profile if it is active"
notice "stow --delete $OTHER_PROFILE"
stow --delete "$OTHER_PROFILE"

if $ALREADY_STOWED; then
  info "Stowing common + $PROFILE"
  notice "stow common $PROFILE"
  stow common "$PROFILE"
else
  info "Adopting existing Omarchy configuration"
  notice "stow --adopt common $PROFILE"
  stow --adopt common "$PROFILE"

  info "Restoring the versions tracked in dotfiles"
  notice "git restore --source=HEAD --worktree -- common $PROFILE"
  git restore --source=HEAD --worktree -- common "$PROFILE"

  info "Stowing common + $PROFILE"
  notice "stow common $PROFILE"
  stow common "$PROFILE"
fi

if command -v hyprctl >/dev/null 2>&1 && [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then
  info "Reloading Hyprland"
  notice "hyprctl reload"
  hyprctl reload

  CONFIG_ERRORS=$(hyprctl configerrors)
  if [[ -n "$CONFIG_ERRORS" ]]; then
    printf '%s\n' "$CONFIG_ERRORS" >&2
    error "Hyprland reported configuration errors"
  fi
fi

success "The $PROFILE profile is ready"

#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cd "$DOTFILES"

if ! command -v stow >/dev/null 2>&1; then
  echo "stow not found; attempting to install it."
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y stow
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y stow
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm stow
  elif command -v brew >/dev/null 2>&1; then
    brew install stow
  elif command -v zypper >/dev/null 2>&1; then
    sudo zypper install -y stow
  else
    echo "No supported package manager found. Please install GNU stow and re-run."
    exit 1
  fi
fi

for dir in */; do
  dir="${dir%/}"
  case "$dir" in
    .git) continue ;;
  esac
  stow -t "$HOME" "$dir"
done

echo "Dotfiles stowed successfully."

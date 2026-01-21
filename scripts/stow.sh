#!/usr/bin/env bash

set -euox pipefail

: "${DOTFILES:=$(dirname -- "${BASH_SOURCE[0]}")/../}"

cd $DOTFILES
stow -t ~ nvim

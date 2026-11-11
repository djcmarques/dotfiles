#!/usr/bin/env bash
set -e
set -o pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

# Codespaces supports passwordless sudo; root needs no elevation.
SUDO=()
if [[ $EUID -ne 0 ]]; then
  SUDO=(sudo)
fi

if ! command -v zsh >/dev/null 2>&1; then
  "${SUDO[@]}" apt-get update
  "${SUDO[@]}" apt-get install -y zsh
fi

# Preserve any existing configuration until our symlink is installed.
if [[ ! -d "$ZSH" ]]; then
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh |
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -s -- --unattended
fi

mkdir -p "$ZSH_CUSTOM/plugins"
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  if [[ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]]; then
    git clone --depth=1 "https://github.com/zsh-users/$plugin.git" "$ZSH_CUSTOM/plugins/$plugin"
  fi
done

ln -sfn "$REPO_DIR/.zshrc" "$HOME/.zshrc"
chsh -s "$(command -v zsh)" "$(id -un)" || true

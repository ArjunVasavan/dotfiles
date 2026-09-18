#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Back up existing .vimrc if it's not already our symlink
if [ -e "$HOME/.vimrc" ] && [ ! -L "$HOME/.vimrc" ]; then
  mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
  echo "Backed up existing ~/.vimrc to ~/.vimrc.bak"
fi

ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
echo "Linked $DOTFILES_DIR/vimrc -> ~/.vimrc"

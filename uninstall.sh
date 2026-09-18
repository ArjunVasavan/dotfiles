#!/usr/bin/env bash
set -e

# Remove the symlink if it's ours
if [ -L "$HOME/.vimrc" ]; then
  rm "$HOME/.vimrc"
  echo "Removed symlink ~/.vimrc"
fi

# Restore backup if it exists
if [ -e "$HOME/.vimrc.bak" ]; then
  mv "$HOME/.vimrc.bak" "$HOME/.vimrc"
  echo "Restored ~/.vimrc from ~/.vimrc.bak"
fi

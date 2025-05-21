#!/bin/bash

echo "🔗 Setting up dotfile symlinks..."

# Dotfiles
ln -sf ~/Documents/tools/zshrc ~/.zshrc
ln -sf ~/Documents/tools/zsh_aliases ~/.zsh_aliases

# Config folders
mkdir -p ~/.config
ln -sf ~/Documents/tools/nvim ~/.config/nvim
ln -sf ~/Documents/tools/karabiner ~/.config/karabiner

echo "✅ Done! Dotfiles and configs are now linked."

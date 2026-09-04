#!/usr/bin/env bash
# install.sh - Script para instalar y enlazar dotfiles

DOTFILES_DIR=$(pwd)

echo "Creando enlaces simbólicos..."

echo "Enlazando .zshrc"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "Enlazando .vimrc"
ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"

echo "Enlazando la carpeta .config"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/.config" "$HOME/.config/dotfiles"



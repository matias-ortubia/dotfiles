#!/usr/bin/env bash

set -e  # Ends the script if a command fails

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Updating..."
sudo pacman -Syu --noconfirm

# ---------------------------------------------------------------
# Packages from the official Arch repository.
# Add new packages to the PACMAN_PACKAGES list
# ---------------------------------------------------------------
echo "==> Installing official packages..."
PACMAN_PACKAGES=(
    stow
    git
    zsh
    kitty
    starship
    fastfetch
    vim
    neovim
    yazi
    mpd
    mpc
    unzip
    unrar
    p7zip
    zip
    ttf-jetbrains-mono-nerd
    ttf-liberation
    ttf-dejavu
    noto-fonts
    noto-fonts-emoji
    bat
    viu
    glow
    btop
    impala
    wiremix
    bluez
    bluez-utils
    bluetui
    rofi
    vivid
    astroterm
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    wl-clipboard
    tree-sitter-cli
)
sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"

# ---------------------------------------------------------------
# 3. AUR: installs yay if needed, and then AUR packages
# ---------------------------------------------------------------
if ! command -v yay &>/dev/null; then
    echo "==> Installing yay (AUR helper)..."
    tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp_dir"
    (cd "$tmp_dir" && makepkg -si --noconfirm)
    rm -rf "$tmp_dir"
fi

echo "==> Installing AUR packages..."
AUR_PACKAGES=(
    rmpc
    kwin-effect-rounded-corners-git
    yay -S shell-color-scripts-git
)
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

# ---------------------------------------------------------------
# 4. Creates symlinks with stow
#    Each name has to be a real directory inside this repository.
# ---------------------------------------------------------------
echo "==> Creating symlinks with stow..."
cd "$DOTFILES_DIR"
STOW_PACKAGES=(
    kitty
    zsh
    vim
    nvim
    gvim
    starship
    fastfetch
)

for pkg in "${STOW_PACKAGES[@]}"; do
    if [ -d "$pkg" ]; then
        echo "  -> stow $pkg"
        stow -t "$HOME" "$pkg"
    else
        echo "  !! directory '$pkg' not found inside the repository, skipping."
    fi
done

# --------------------------------------------------------------
# 5. Install tools for other programs
# --------------------------------------------------------------
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ---------------------------------------------------------------
# 6. Change default Shell
# ---------------------------------------------------------------
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "==> Changing default shell to zsh..."
    chsh -s "$(command -v zsh)"
fi

echo ""
echo "==> Configuration finished."

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
    less
    zsh
    kitty
    ghostty
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
    go
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
    shell-color-scripts-git
    anifetch-cli
    peaclock
)
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

# ---------------------------------------------------------------
# Standalone programs
# ---------------------------------------------------------------
install_go_tool() {
    local repo_url="$1"
    local bin_name="$2"
    local repo_name
    repo_name=$(basename "$repo_url" .git)
    local src_dir="$HOME/.local/src/$repo_name"

    mkdir -p "$HOME/.local/src" "$HOME/.local/bin"

    if [ -d "$src_dir" ]; then
        echo "  -> $repo_name already cloned, updating..."
        git -C "$src_dir" pull
    else
        echo "  -> Cloning $repo_name..."
        git clone "$repo_url" "$src_dir"
    fi

    (cd "$src_dir" && go build -o "$bin_name")
    cp "$src_dir/$bin_name" "$HOME/.local/bin/$bin_name"
    echo "  -> $bin_name instalado en ~/.local/bin"
}

echo "==> Installing standalone tools..."
install_go_tool "https://github.com/marsboy02/bad-apple.git" "bad-apple"

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
# 5. Programs that require other installation methods
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

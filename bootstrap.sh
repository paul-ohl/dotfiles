#!/usr/bin/env bash
# Nix/NixOS Bootstrap Script
# Usage: curl -L https://your-server.com/bootstrap.sh | bash
# Or: bash bootstrap.sh

set -e

DOTFILES_REPO="https://github.com/paul-ohl/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
NIX_CONFIG_DIR="$DOTFILES_DIR/nixos"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Detect if we're on NixOS
is_nixos() {
    [ -f /etc/NIXOS ] || [ -f /etc/os-release ] && grep -q "ID=nixos" /etc/os-release 2>/dev/null
}

# Check if Nix is installed
has_nix() {
    command -v nix &> /dev/null
}

# Clone dotfiles repository
clone_dotfiles() {
    log "Cloning dotfiles repository..."

    if [ -d "$DOTFILES_DIR" ]; then
        warn "Dotfiles directory already exists at $DOTFILES_DIR"
        read -p "Do you want to pull latest changes? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            cd "$DOTFILES_DIR"
            git pull
        fi
    else
        git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    fi
}

# Install Nix on non-NixOS system
install_nix() {
    log "Installing Nix package manager..."

    if has_nix; then
        log "Nix is already installed"
        return
    fi

    # Install Nix with flakes enabled
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
        sh -s -- install --no-confirm

    # Source Nix
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh || \
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"

    log "Nix installed successfully"
}

# Setup user environment on non-NixOS system
setup_nix_system() {
    log "Setting up Nix user environment..."

    # Ensure Nix is available
    if ! has_nix; then
        error "Nix is not installed. This should not happen!"
    fi

    # Source Nix profile
    if [ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    elif [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/nix.sh"
    fi

    log "Installing user packages from configuration..."

    # Install packages from the user configuration
    if [ -f "$NIX_CONFIG_DIR/user-packages.nix" ]; then
        cd "$NIX_CONFIG_DIR"

        log "Installing packages from user-packages.nix..."
        nix profile install --impure --file user-packages.nix

        log "Packages installed successfully!"
    else
        warn "No user-packages.nix found. Skipping package installation."
    fi

    # Setup shell configuration if present
    if [ -f "$NIX_CONFIG_DIR/shell-config.sh" ]; then
        log "Setting up shell configuration..."

        SHELL_RC=""
        if [ -n "$BASH_VERSION" ]; then
            SHELL_RC="$HOME/.bashrc"
        elif [ -n "$ZSH_VERSION" ]; then
            SHELL_RC="$HOME/.zshrc"
        fi
    fi

    log "Nix user environment setup complete!"
}

# Setup NixOS system
setup_nixos() {
    log "Setting up NixOS configuration..."

    # Check if we have permission (need sudo for NixOS)
    if [ "$EUID" -ne 0 ]; then
        warn "NixOS setup requires root privileges"
        log "Attempting to use sudo..."
    fi

    # Link configuration to /etc/nixos
    log "Your current hostname is: $(hostname), do you want to use this? (y/n)"

    read -r -n 1 REPLY
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        read -p "Enter desired hostname: " HOSTNAME
        sudo hostnamectl set-hostname "$HOSTNAME" && log "Hostname set to $HOSTNAME" || error "Failed to set hostname"
    else
        HOSTNAME=$(hostname)
    fi

    HOSTNAME=$(hostname)
    log "Using hostname: $HOSTNAME"

    if [ -f "$NIX_CONFIG_DIR/flake.nix" ]; then
        cd "$NIX_CONFIG_DIR"

        # Build and switch
        sudo nixos-rebuild switch --flake ".#$HOSTNAME" || \
        sudo nixos-rebuild switch --flake ".#default"

        log "NixOS configuration applied successfully!"
    else
        error "No flake.nix found in $NIX_CONFIG_DIR"
    fi
}

# Main execution
main() {
    log "Starting Nix/NixOS bootstrap..."

    # Check for git
    if ! command -v git &> /dev/null; then
        # Install git if missing on selected systems
        if command -v apt-get &> /dev/null; then
            log "Installing git using apt-get..."
            sudo apt-get update && sudo apt-get install -y git
        elif command -v dnf &> /dev/null; then
            log "Installing git using dnf..."
            sudo dnf install -y git
        elif command -v pacman &> /dev/null; then
            log "Installing git using pacman..."
            sudo pacman -Sy --noconfirm git
          elif command -v brew &> /dev/null; then
            log "Installing git using brew..."
            brew install git
        else
            error "Unsupported package manager. Please install git manually."
        fi
    fi

    # Clone dotfiles
    clone_dotfiles

    # Detect system and proceed accordingly
    if is_nixos; then
        log "Detected NixOS system"
        setup_nixos
    else
        log "Detected non-NixOS system"

        # Install Nix if needed
        if ! has_nix; then
            install_nix
        fi

        # Setup user environment
        setup_nix_system
    fi

    log "Bootstrap complete! 🎉"
    log "You may need to restart your shell or log out and back in."
}

# Run main function
main "$@"

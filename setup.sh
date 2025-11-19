#!/usr/bin/env zsh
# ==========================================
# Dotfiles Setup Script
# ==========================================
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Logging
log_info() { echo -e "${BLUE}ℹ${NC} $1"; }
log_success() { echo -e "${GREEN}✓${NC} $1"; }
log_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
log_error() { echo -e "${RED}✗${NC} $1"; }
log_header() { echo -e "\n${PURPLE}▶${NC} $1"; }

# Utilities
command_exists() { command -v "$1" >/dev/null 2>&1; }
brew_package_installed() { brew list "$1" >/dev/null 2>&1; }

main() {
    log_header "Dotfiles Setup for macOS"

    # Check macOS
    if [[ "$OSTYPE" != "darwin"* ]]; then
        log_error "macOS required"
        exit 1
    fi

    # Install Homebrew
    if ! command_exists brew; then
        log_warning "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Install dependencies
    log_header "Installing dependencies..."
    local packages=(starship fzf zoxide eza bat direnv)
    for pkg in "${packages[@]}"; do
        if brew_package_installed "$pkg"; then
            log_success "$pkg installed"
        else
            log_info "Installing $pkg..."
            brew install "$pkg" && log_success "$pkg installed"
        fi
    done

    # Create symlinks
    log_header "Creating symlinks..."
    DOTFILES="$HOME/.dotfiles"

    for file in .zshenv .zprofile .zshrc; do
        if [[ -f "$HOME/$file" && ! -L "$HOME/$file" ]]; then
            mv "$HOME/$file" "$HOME/${file}.backup.$(date +%Y%m%d)"
            log_warning "Backed up existing $file"
        fi
        ln -sf "$DOTFILES/$file" "$HOME/$file"
        log_success "$file linked"
    done

    # Starship config
    mkdir -p "$HOME/.config"
    ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
    log_success "starship.toml linked"

    # Create local.zshenv if it doesn't exist
    if [[ ! -f "$DOTFILES/local.zshenv" ]]; then
        log_info "Creating local.zshenv template..."
        cp "$DOTFILES/local.zshenv" "$DOTFILES/local.zshenv" 2>/dev/null || true
        log_warning "Create $DOTFILES/local.zshenv for machine-specific environment config"
    fi

    log_success "\n🎉 Setup complete!"
    log_info "Restart your terminal or run: source ~/.zshrc"
}

main "$@"

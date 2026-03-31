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
    local packages=(starship fzf zoxide eza bat direnv mise uv shfmt fd git-delta zsh-autosuggestions zsh-syntax-highlighting)
    for pkg in "${packages[@]}"; do
        if brew_package_installed "$pkg"; then
            log_success "$pkg installed"
        else
            log_info "Installing $pkg..."
            brew install "$pkg" && log_success "$pkg installed"
        fi
    done

    # k9s (Kubernetes TUI) — available via homebrew/core or derailed/k9s tap
    if ! command_exists k9s; then
        log_info "Installing k9s..."
        brew install k9s && log_success "k9s installed"
    else
        log_success "k9s installed"
    fi

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

    # mise config
    mkdir -p "$HOME/.config/mise"
    if [[ -f "$HOME/.config/mise/config.toml" && ! -L "$HOME/.config/mise/config.toml" ]]; then
        mv "$HOME/.config/mise/config.toml" "$HOME/.config/mise/config.toml.backup.$(date +%Y%m%d)"
        log_warning "Backed up existing mise/config.toml"
    fi
    ln -sf "$DOTFILES/mise/config.toml" "$HOME/.config/mise/config.toml"
    mise trust "$DOTFILES/mise/config.toml" >/dev/null 2>&1 || true
    log_success "mise/config.toml linked"

    # Create local.zshenv if it doesn't exist
    if [[ ! -f "$DOTFILES/local.zshenv" ]]; then
        log_info "Creating local.zshenv template..."
        cat >"$DOTFILES/local.zshenv" <<'EOF'
#!/usr/bin/env zsh
# Machine-specific environment variables only
# This file is sourced by ~/.zshenv for all shell invocations
EOF
        log_warning "Create $DOTFILES/local.zshenv for machine-specific environment config"
    fi

    # Install global Python via uv
    log_header "Installing global Python via uv..."
    if command_exists uv; then
        uv python install 3.12 --default && log_success "Python 3.12 installed as global default via uv"
    else
        log_warning "uv not available; skipping Python install"
    fi

    # Install Python CLI tools via uv
    log_header "Installing Python CLI tools..."
    if command_exists uv; then
        uv tool install --upgrade pre-commit
        log_success "pre-commit installed via uv"
    else
        log_warning "uv not available; skipping Python CLI tool installation"
    fi

    # Install pre-commit hooks
    log_header "Installing pre-commit hooks..."
    if command_exists pre-commit; then
        (cd "$DOTFILES" && pre-commit install)
        log_success "pre-commit hooks installed"
    else
        log_warning "pre-commit not available; skipping hook installation"
    fi

    log_success "\n🎉 Setup complete!"
    log_info "Restart your terminal or run: source ~/.zshrc"
}

main "$@"

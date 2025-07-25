#!/usr/bin/env zsh

# ==========================================
# Dotfiles Setup Script
# ==========================================
# Modern ZSH configuration setup with dependency management

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

log_success() {
    echo -e "${GREEN}✓${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

log_header() {
    echo -e "${PURPLE}▶${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Homebrew package is installed
brew_package_installed() {
    brew list "$1" >/dev/null 2>&1
}

# ==========================================
# Dependency Installation
# ==========================================
install_dependencies() {
    log_header "Checking and installing dependencies..."
    
    # Check for Homebrew (command or Apple Silicon location)
    if ! command_exists brew && [[ ! -f "/opt/homebrew/bin/brew" ]]; then
        log_warning "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        log_success "Homebrew installed successfully"
    else
        # If Homebrew exists but brew command isn't in PATH, add it
        if [[ ! $(command -v brew) && -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        log_success "Homebrew already installed"
    fi
    
    # List of required packages
    local packages=("starship" "fzf" "zoxide" "eza" "bat" "direnv")
    
    for package in "${packages[@]}"; do
        if brew_package_installed "$package"; then
            log_success "$package already installed"
        else
            log_info "Installing $package..."
            brew install "$package"
            log_success "$package installed successfully"
        fi
    done
    
    # Install Zinit if not present
    local zinit_dir="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
    if [[ ! -d "$zinit_dir" ]]; then
        log_info "Installing Zinit plugin manager..."
        bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
        log_success "Zinit installed successfully"
    else
        log_success "Zinit already installed"
    fi
}

# ==========================================
# System Requirements Check
# ==========================================
check_requirements() {
    log_header "Checking system requirements..."
    
    # Check if running on macOS
    if [[ "$OSTYPE" != "darwin"* ]]; then
        log_error "This configuration is designed for macOS"
        exit 1
    fi
    
    # Check ZSH availability
    if ! command_exists zsh; then
        log_error "ZSH is not installed. Please install ZSH first."
        exit 1
    fi
    
    log_success "System requirements met"
}
# ==========================================
# Backup existing configurations
# ==========================================
backup_if_exists() {
    local file="$1"
    if [[ -f "$file" ]] || [[ -L "$file" ]]; then
        local backup_file="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        log_warning "Backing up existing $file to $backup_file"
        mv "$file" "$backup_file"
    fi
}

# ==========================================
# Create symbolic links
# ==========================================
create_symlink() {
    local source="$1"
    local target="$2"
    local target_dir="$(dirname "$target")"
    
    # Create target directory if it doesn't exist
    if [[ ! -d "$target_dir" ]]; then
        mkdir -p "$target_dir"
        log_info "Created directory: $target_dir"
    fi
    
    # Backup existing file/link
    backup_if_exists "$target"
    
    # Create symlink
    ln -s "$source" "$target"
    log_success "Linked $source → $target"
}

# ==========================================
# Post-setup validation
# ==========================================
validate_setup() {
    log_header "Validating setup..."
    
    local errors=0
    
    # Check if symbolic links were created successfully
    local links=(
        "$HOME/.zshrc:$DOTFILES_DIR/zsh/.zshrc"
        "$HOME/.config/starship.toml:$DOTFILES_DIR/starship/starship.toml"
    )
    
    # Add Ghostty config if it exists
    if [[ -L "$HOME/.config/ghostty/config" ]]; then
        links+=("$HOME/.config/ghostty/config:$DOTFILES_DIR/ghostty/config")
    fi
    
    for link_info in "${links[@]}"; do
        local target="${link_info%%:*}"
        local source="${link_info##*:}"
        
        if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$source" ]]; then
            log_success "Link verified: $target → $source"
        else
            log_error "Link failed: $target should point to $source"
            ((errors++))
        fi
    done
    
    # Check if required commands are available
    local commands=("starship" "fzf" "zoxide" "eza" "bat")
    for cmd in "${commands[@]}"; do
        if command_exists "$cmd"; then
            log_success "Command available: $cmd"
        else
            log_error "Command not found: $cmd"
            ((errors++))
        fi
    done
    
    if [[ $errors -eq 0 ]]; then
        log_success "Setup validation completed successfully"
        return 0
    else
        log_error "Setup validation failed with $errors errors"
        return 1
    fi
}

# ==========================================
# Main setup process
# ==========================================
main() {
    log_header "Modern ZSH Configuration Setup"
    echo ""
    
    # Get the dotfiles directory
    DOTFILES_DIR="$HOME/.dotfiles"
    
    if [[ ! -d "$DOTFILES_DIR" ]]; then
        log_error "Dotfiles directory not found: $DOTFILES_DIR"
        exit 1
    fi
    
    # Run setup steps
    check_requirements
    install_dependencies
    
    # Create symbolic links
    log_header "Creating symbolic links..."
    
    # ZSH configuration
    create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    
    # Starship configuration
    mkdir -p "$HOME/.config"
    create_symlink "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
    
    # Ghostty configuration (only if Ghostty is installed)
    if [[ -d "/Applications/Ghostty.app" ]] || command_exists ghostty; then
        create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
    else
        log_info "Ghostty not found, skipping Ghostty configuration"
    fi
    
    # Validate the setup
    validate_setup
    
    log_success "Dotfiles setup completed successfully!"
    
    # Post-setup instructions
    echo ""
    log_header "Next steps:"
    echo "  1. Restart your terminal or run: source ~/.zshrc"
    echo "  2. The first startup might be slower as plugins are downloaded"
    echo "  3. Use 'zinit times' to check plugin loading performance"
    echo "  4. Create ~/.dotfiles/zsh/local.zsh for machine-specific customizations"
    echo ""
    log_info "Key bindings:"
    echo "  • Ctrl+R: FZF history search"
    echo "  • Ctrl+T: FZF file finder"
    echo "  • Alt+C:  FZF directory navigation"
    echo "  • Ctrl+X+Ctrl+K: Process killer"
    echo ""
    log_warning "Note: Do not run 'exec zsh' as it may break your current session"
}

# Run the setup
main "$@"

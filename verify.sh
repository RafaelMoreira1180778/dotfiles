#!/usr/bin/env zsh

# ==========================================
# Dotfiles Verification Script
# ==========================================
# Verify that the dotfiles are properly installed and working

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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
    echo -e "\n${BLUE}▶${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main verification function
main() {
    echo "🔍 Dotfiles Verification Report"
    echo "=============================="

    local errors=0

    # Check symbolic links
    log_header "Checking symbolic links..."

    if [[ -L "$HOME/.zshenv" ]] && [[ "$(readlink "$HOME/.zshenv")" == "$HOME/.dotfiles/zsh/.zshenv" ]]; then
        log_success "ZSH environment (.zshenv) linked correctly"
    else
        log_error "ZSH environment (.zshenv) not linked properly"
        ((errors++))
    fi

    if [[ -L "$HOME/.zshrc" ]] && [[ "$(readlink "$HOME/.zshrc")" == "$HOME/.dotfiles/zsh/.zshrc" ]]; then
        log_success "ZSH configuration linked correctly"
    else
        log_error "ZSH configuration not linked properly"
        ((errors++))
    fi

    if [[ -L "$HOME/.config/starship.toml" ]] && [[ "$(readlink "$HOME/.config/starship.toml")" == "$HOME/.dotfiles/starship/starship.toml" ]]; then
        log_success "Starship configuration linked correctly"
    else
        log_error "Starship configuration not linked properly"
        ((errors++))
    fi

    # Check required commands
    log_header "Checking required tools..."

    local commands=("starship" "fzf" "zoxide" "eza" "bat" "direnv" "uv" "asdf" "docker" "kubectl" "helm" "kubecolor")
    for cmd in "${commands[@]}"; do
        if [[ "$cmd" == "zinit" ]]; then
            if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
                log_success "Zinit is installed"
            else
                log_error "Zinit is not installed"
                ((errors++))
            fi
        elif command_exists "$cmd"; then
            log_success "$cmd is available"
        else
            log_warning "$cmd is not installed or not in PATH (optional)"
        fi
    done

    # Check ZSH configuration modules
    log_header "Checking ZSH modules..."

    local modules=("exports.zsh" "history.zsh" "options.zsh" "plugins.zsh" "completions.zsh" "fzf.zsh" "aliases.zsh" "keybindings.zsh" "functions.zsh" "tools.zsh")
    for module in "${modules[@]}"; do
        if [[ -f "$HOME/.dotfiles/zsh/$module" ]]; then
            log_success "$module exists"
        else
            log_error "$module is missing"
            ((errors++))
        fi
    done

    # Check completion cache
    if [[ -d "$HOME/.dotfiles/zsh/completions_cache" ]]; then
        log_success "Completion cache directory exists"
        if [[ -f "$HOME/.dotfiles/zsh/completions_cache/_kubectl" ]]; then
            log_success "kubectl completions cached"
        else
            log_warning "kubectl completions not cached (run refresh_completions)"
        fi
    else
        log_warning "Completion cache directory not found"
    fi

    # Performance check
    log_header "Performance check..."

    if command_exists zsh; then
        local startup_time=$(time zsh -i -c exit 2>&1 | grep real | awk '{print $2}')
        if [[ -n "$startup_time" ]]; then
            log_info "ZSH startup time: $startup_time"
        fi
    fi

    # Summary
    log_header "Summary"

    if [[ $errors -eq 0 ]]; then
        log_success "All checks passed! Your dotfiles are properly configured."
        echo ""
        echo "🎉 Ready to use!"
        echo "Key bindings:"
        echo "  • Ctrl+R: FZF history search"
        echo "  • Ctrl+T: FZF file finder"
        echo "  • Alt+C:  FZF directory navigation"
        echo "  • Ctrl+X+Ctrl+K: Process killer"
        echo ""
        echo "Useful commands:"
        echo "  • zinit times: Check plugin loading times"
        echo "  • reload: Reload ZSH configuration"
        echo "  • dotfiles: Open dotfiles in VS Code"
    else
        log_error "Found $errors issues. Please check the output above."
        echo ""
        echo "To fix issues, try running: ~/.dotfiles/setup.sh"
    fi
}

main "$@"

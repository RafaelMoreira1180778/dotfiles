# ==========================================
# Modern ZSH Configuration
# ==========================================
# Fast, efficient, and feature-rich ZSH setup
# Modular configuration with clear separation of concerns

# Configuration directory
ZSHCONFIG="$HOME/.dotfiles/zsh"

# ==========================================
# Load configuration modules in order
# ==========================================

# 1. Environment variables and PATH
source "$ZSHCONFIG/exports.zsh"

# 2. History configuration
source "$ZSHCONFIG/history.zsh"

# 3. ZSH options and behavior
source "$ZSHCONFIG/options.zsh"

# 4. Plugin management (loads Zinit and plugins)
source "$ZSHCONFIG/plugins.zsh"

# 5. Completion system (must be after plugins that add completions)
source "$ZSHCONFIG/completions.zsh"

# 6. FZF integration and functions
source "$ZSHCONFIG/fzf.zsh"

# 7. Aliases and shortcuts
source "$ZSHCONFIG/aliases.zsh"

# 8. Key bindings (must be after FZF functions are defined)
source "$ZSHCONFIG/keybindings.zsh"

# 9. Custom functions and final integrations
source "$ZSHCONFIG/functions.zsh"

# 10. Local configuration (machine-specific settings)
# This must be sourced last to allow overrides
[[ -f "$ZSHCONFIG/local.zsh" ]] && source "$ZSHCONFIG/local.zsh"

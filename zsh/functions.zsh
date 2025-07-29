# ==========================================
# Custom Functions
# ==========================================
# Utility functions and integrations

# ==========================================
# Zoxide Configuration (Smart CD)
# ==========================================
# Initialize zoxide with cd command (replaces cd with smart directory jumping)
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# ==========================================
# Direnv Initialization
# ==========================================
# Initialize direnv prompt
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# ==========================================
# Pyenv Initialization
# ==========================================
# Initialize pyenv
if command -v direnv >/dev/null 2>&1; then
    eval "$(pyenv init - zsh)"
fi

# ==========================================
# Starship Prompt Initialization
# ==========================================
# Initialize Starship prompt (must be at end)
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

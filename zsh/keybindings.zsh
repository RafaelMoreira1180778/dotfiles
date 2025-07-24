# ==========================================
# Key Bindings
# ==========================================
# Keyboard shortcuts and widget bindings

# ==========================================
# Basic key bindings
# ==========================================
# Use emacs key bindings
bindkey -e

# Enhanced navigation
bindkey '^[[1;5C' forward-word    # Ctrl+Right Arrow
bindkey '^[[1;5D' backward-word   # Ctrl+Left Arrow
bindkey '^[[H' beginning-of-line  # Home key
bindkey '^[[F' end-of-line        # End key

# ==========================================
# FZF key bindings
# ==========================================
bindkey '^R' fzf-history-widget     # Ctrl+R: History search
bindkey '^T' fzf-file-widget        # Ctrl+T: File selection
bindkey '\ec' fzf-cd-widget         # Alt+C: Directory navigation
bindkey '^X^K' fzf-kill-process     # Ctrl+X+Ctrl+K: Process killer

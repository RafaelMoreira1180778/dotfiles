# ==========================================
# Completion System Configuration
# ==========================================
# Advanced tab completion setup with Homebrew integration

# Add Homebrew completions to FPATH FIRST
FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

# Initialize completion system BEFORE loading plugins
autoload -U compinit && compinit

# ==========================================
# Completion Styles
# ==========================================

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colored completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Use menu selection for completions
zstyle ':completion:*' menu select

# Cache completions for better performance
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"

# Group completions by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# Configure completion behavior for better integration
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Better file completion
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' special-dirs true

# Force rehash to pick up new completions
zstyle ':completion:*' rehash true

# Remove any FZF interference with completions
zstyle -d ':completion:*' fzf-search-display

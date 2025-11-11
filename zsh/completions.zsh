# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  Completion System Setup
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Add Homebrew and custom completions to FPATH
fpath=(
  "$(brew --prefix)/share/zsh/site-functions"
  "$HOME/.zsh/cache/completions"
  $fpath
)

# Initialize completion system
autoload -Uz compinit
compinit -C

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  COMPLETION STYLES
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colored completion
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

# Cache completions for better performance
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"

# Group completions by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# Standard completion behavior
zstyle ':completion:*' completer _complete

# File sorting and directory handling
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' special-dirs true

# Force rehash to pick up new completions
zstyle ':completion:*' rehash true

# Menu selection for completions
zstyle ':completion:*' menu select

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ALIAS COMPLETIONS
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# kubectl completions work with kubecolor and k aliases
compdef kubecolor=kubectl
compdef k=kubectl

# AWS CLI completions (requires bashcompinit)
autoload -Uz bashcompinit && bashcompinit
complete -C aws_completer aws

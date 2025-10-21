# ┌─────────────────────────────────────────────────────────────────────────────┐
# │                                                                               │
# │                        Plugin Management (Zinit)                             │
# │                       Minimal Essential Plugins Only                         │
# │                                                                               │
# └─────────────────────────────────────────────────────────────────────────────┘

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ZINIT INITIALIZATION
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zinit...%f"
    command mkdir -p "${ZINIT_HOME}" && command chmod g-rwX "${ZINIT_HOME}"
    command git clone https://github.com/zdharma-continuum/zinit "${ZINIT_HOME}" &&
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" ||
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi

source "${ZINIT_HOME}/zinit.zsh"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ESSENTIAL PLUGINS (IMMEDIATE LOADING)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Enhanced completions
zinit light zsh-users/zsh-completions

# Syntax highlighting - load early for better performance
zinit light zsh-users/zsh-syntax-highlighting

# Smart command suggestions from history
zinit light zsh-users/zsh-autosuggestions

# FZF-style completions (must be loaded after other completion plugins)
zinit light Aloxaf/fzf-tab

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  PLUGIN CONFIGURATION
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Configure zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6272a4"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Configure zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red') # Highlight dangerous commands

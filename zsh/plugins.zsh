# ==========================================
# Plugin Management with Zinit
# ==========================================
# Fast plugin loading and management

# Initialize Zinit if not already done
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zinit...%f"
    command mkdir -p "${ZINIT_HOME}" && command chmod g-rwX "${ZINIT_HOME}"
    command git clone https://github.com/zdharma-continuum/zinit "${ZINIT_HOME}" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# ==========================================
# Essential Plugins (Immediate Loading)
# ==========================================

# Enhanced completions - load before other completion-related plugins
zinit light zsh-users/zsh-completions

# Syntax highlighting - load early for better performance
zinit light zsh-users/zsh-syntax-highlighting

# Autosuggestions - smart command suggestions based on history
zinit light zsh-users/zsh-autosuggestions

# fzf tab - FZF-style completion (must be loaded after completions)
zinit light Aloxaf/fzf-tab

# ==========================================
# Performance: Lazy load completions
# ==========================================
# Defer loading of some completions for faster startup
zinit wait lucid for \
    OMZP::git \
    OMZP::docker \
    OMZP::docker-compose \
    OMZP::python \
    OMZP::pip \
    OMZP::brew \
    OMZP::node \
    OMZP::npm

# ==========================================
# Additional Useful Plugins (Lazy Loaded)
# ==========================================
# Load these plugins after 1 second for better startup performance
zinit wait"1" lucid for \
    OMZP::colored-man-pages \
    OMZP::command-not-found

# ==========================================
# Plugin Configuration
# ==========================================

# Configure zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6272a4"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Configure zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')  # Highlight dangerous commands

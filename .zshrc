#!/usr/bin/env zsh
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ZSH Configuration - Simplified & Optimized
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ENVIRONMENT VARIABLES
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Core
export EDITOR='code'
export VISUAL='code'
export BROWSER='open'
export PAGER='less'
export TERM='xterm-256color'
export COLORTERM='truecolor'

# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# Python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# GPG
export GPG_TTY="$(tty)"

# AWS
export AWS_DEFAULT_REGION="eu-central-1"
export AWS_REGION="eu-central-1"

# Less pager
export LESS='-R -i -w -M -z-4'
export LESSHISTFILE='-'

# Man pages via bat (syntax-highlighted)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT='-c'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  HISTORY
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  SHELL OPTIONS
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Directory Navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Completion Behavior
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH

# Globbing
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt NUMERIC_GLOB_SORT

# Job Control
setopt AUTO_RESUME
setopt LONG_LIST_JOBS
setopt NOTIFY

# Input/Output
setopt INTERACTIVE_COMMENTS
setopt RC_QUOTES
setopt COMBINING_CHARS

# Safety
unsetopt CLOBBER
setopt RM_STAR_WAIT

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  COMPLETION SYSTEM
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Add Homebrew completions to FPATH
fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)

# Initialize completion system — full check once per day, cached otherwise
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Completion styles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh_cache"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' rehash true

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ALIASES
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Modern replacements
alias ls='eza --group-directories-first'
alias ll='eza -la --group-directories-first --git'
alias la='eza -la --group-directories-first'
alias tree='eza --tree --level=2'

# bat — colorized cat
alias cat='bat --paging=never'

# Shortcuts
alias dotfiles='code ~/.dotfiles'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  FZF CONFIGURATION
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Use fd as the default source — respects .gitignore, shows hidden files
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border --info inline'

# Ctrl-T: file picker with bat syntax preview; ctrl-/ toggles preview pane
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Ctrl-R: history search; ctrl-y copies selected command to clipboard
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Alt-C: directory picker with eza tree preview
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules
  --preview 'eza --tree --level=2 --color=always {}'"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  TOOL INITIALIZATION
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Starship prompt
eval "$(starship init zsh)"

# Zoxide (smart cd)
eval "$(zoxide init --cmd cd zsh)"

# Direnv (per-directory environment)
eval "$(direnv hook zsh)"

# FZF key bindings and completions
if [[ -d "/opt/homebrew/opt/fzf" ]]; then
    source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
    source "/opt/homebrew/opt/fzf/shell/completion.zsh"
fi

# mise version manager
eval "$(mise activate zsh)"

# Python Virtual Environment Auto-Activation
autoload -U add-zsh-hook

_auto_activate_venv() {
    # Deactivate current venv if we're in one
    if [[ -n "$VIRTUAL_ENV" ]]; then
        local CURRENT_VENV_DIR=$(dirname "$(dirname "$VIRTUAL_ENV")")
        # If we're not in a subdirectory of the current venv, deactivate
        if [[ "$PWD" != "$CURRENT_VENV_DIR"* ]]; then
            deactivate 2>/dev/null
        fi
    fi

    # Check for venv in current directory
    if [[ -f ".venv/bin/activate" ]]; then
        source ".venv/bin/activate" 2>/dev/null
    elif [[ -f "venv/bin/activate" ]]; then
        source "venv/bin/activate" 2>/dev/null
    fi
}

add-zsh-hook chpwd _auto_activate_venv
_auto_activate_venv # also activate on shell start

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  LOCAL CONFIGURATION (optional overrides)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[[ -f ~/.dotfiles/zsh/local.zsh ]] && source ~/.dotfiles/zsh/local.zsh

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ZSH PLUGINS (must be sourced last)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Fish-like command suggestions from history
# Hardcoded to /opt/homebrew (Apple Silicon) to avoid subprocess on startup
if [[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# Syntax highlighting — must be the very last source in .zshrc
if [[ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

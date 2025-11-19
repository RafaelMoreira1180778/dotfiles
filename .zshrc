#!/usr/bin/env zsh
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ZSH Configuration - Simplified & Optimized
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  PATH CONFIGURATION
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
export PATH="$HOME/.asdf/shims:$PATH"

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

# ASDF
export ASDF_DIR="$HOME/.asdf"

# Less pager
export LESS='-R -i -w -M -z-4'
export LESSHISTFILE='-'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  HISTORY
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

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

# Initialize completion system
autoload -Uz compinit
compinit -C

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
alias cat='bat'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Shortcuts
alias dotfiles='code ~/.dotfiles'

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
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# ASDF version manager
source "$HOME/.asdf/asdf.sh"

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

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  LOCAL CONFIGURATION (optional overrides)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[[ -f ~/.dotfiles/zsh/local.zsh ]] && source ~/.dotfiles/zsh/local.zsh

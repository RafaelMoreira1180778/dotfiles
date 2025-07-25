# ==========================================
# Environment Variables & PATH Configuration
# ==========================================
# All environment exports and PATH modifications

# ==========================================
# PATH Configuration
# ==========================================
# Homebrew paths (Apple Silicon and Intel)
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# User local binaries
export PATH="$HOME/.local/bin:$PATH"

# Development tools
export PATH="$HOME/.cargo/bin:$PATH"      # Rust
export PATH="$HOME/go/bin:$PATH"          # Go

# Volta (Node.js version manager)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ==========================================
# Core Environment Variables
# ==========================================
export EDITOR='code'
export VISUAL='code'
export BROWSER='open'
export PAGER='less'

# Terminal settings
export TERM='xterm-256color'
export COLORTERM='truecolor'

# ==========================================
# Language and Locale
# ==========================================
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# ==========================================
# Development Environment
# ==========================================
# Python configuration
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
export PIP_REQUIRE_VIRTUALENV=true

# Node.js configuration
export NODE_ENV='development'

# Docker configuration
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# ==========================================
# Tool Configuration
# ==========================================
# Zinit home directory
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# FZF configuration
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --info=inline"

# Less configuration (pager)
export LESS='-R -i -w -M -z-4'
export LESSHISTFILE='-'

# Homebrew configuration
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# ==========================================
# XDG Base Directory Specification
# ==========================================
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# ==========================================
# GPG Configuration
# ==========================================
export GPG_TTY="$(tty)"

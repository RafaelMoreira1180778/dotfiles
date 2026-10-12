#!/usr/bin/env zsh

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ZSH Profile - Runs AFTER /etc/zprofile (login shells only)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#
#  This file runs after macOS's /etc/zprofile which calls path_helper and
#  reorders PATH. We restore our preferred order here.
#
#  Note: Only runs for login shells (iTerm2, Terminal.app, SSH sessions).
#  Non-interactive shells (VSCode extensions, LaTeX) only use .zshenv.
#
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  FIX PATH ORDER (after macOS path_helper)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

HOMEBREW_PREFIX="/opt/homebrew"
HOMEBREW_CURL_PREFIX="$HOMEBREW_PREFIX/opt/curl/bin"

# macOS /etc/zprofile calls path_helper and reorders PATH. Restore the Apple
# Silicon Homebrew-first order after that system-level mutation.
typeset -U PATH path=(
    "$HOME/.local/share/mise/shims"
    "$HOME/.local/bin"
    "$HOMEBREW_CURL_PREFIX"
    "$HOMEBREW_PREFIX/bin"
    "$HOMEBREW_PREFIX/sbin"
    $HOMEBREW_PREFIX/opt/*/libexec/gnubin(N-/)
    $path
)

export PATH

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"

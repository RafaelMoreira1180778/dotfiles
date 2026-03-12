#!/usr/bin/env zsh
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

# UV Python 3.12 bin (glob handles minor version bumps, e.g. 3.12.9 -> 3.12.10)
uv_python_312=($HOME/.local/share/uv/python/cpython-3.12.*(N/[1]))

typeset -U PATH path=(
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    ${uv_python_312[1]:+"${uv_python_312[1]}/bin"}
    $path
)
unset uv_python_312

export PATH

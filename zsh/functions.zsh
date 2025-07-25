# ==========================================
# Custom Functions
# ==========================================
# Utility functions and integrations

# ==========================================
# Development Functions
# ==========================================

# Create and enter directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find process and show details
pgrep() {
    ps aux | grep -v grep | grep "$1"
}

# Show git branch in current directory
git-branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2
}

# Quick server for current directory
serve() {
    local port="${1:-8000}"
    echo "Serving current directory on http://localhost:$port"
    python3 -m http.server "$port"
}

# Weather function
weather() {
    local city="${1:-}"
    curl -s "wttr.in/${city}?format=3"
}

# ==========================================
# System Information Functions
# ==========================================

# Show system information
sysinfo() {
    echo "System Information:"
    echo "OS: $(uname -s) $(uname -r)"
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime | awk -F'up ' '{print $2}' | awk -F',' '{print $1}')"
    echo "Memory: $(free -h 2>/dev/null | grep Mem | awk '{print $3 "/" $2}' || echo "N/A on macOS")"
    echo "CPU: $(sysctl -n machdep.cpu.brand_string 2>/dev/null || echo "N/A")"
}

# Show disk usage
diskspace() {
    df -h | grep -E '^/dev/' | awk '{print $5 "\t" $1}' | while read output; do
        echo "$output"
    done
}

# ==========================================
# Zoxide Configuration (Smart CD)
# ==========================================
# Initialize zoxide with cd command (replaces cd with smart directory jumping)
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# ==========================================
# Starship Prompt Initialization
# ==========================================
# Initialize Starship prompt (must be at end)
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

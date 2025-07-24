# ==========================================
# Aliases for Enhanced Productivity
# ==========================================
# Convenient shortcuts and improved command defaults

# ==========================================
# Enhanced ls with colors and details
# ==========================================
alias ls='ls -G'
alias ll='ls -la'
alias la='ls -la'
alias l='ls -CF'

# ==========================================
# Safe file operations
# ==========================================
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ==========================================
# Directory operations
# ==========================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ==========================================
# Git shortcuts
# ==========================================
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'

# ==========================================
# Docker shortcuts
# ==========================================
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias di='docker images'

# ==========================================
# Python shortcuts
# ==========================================
alias py='python3'
alias pip='pip3'

# ==========================================
# Quick edit common files
# ==========================================
alias zshrc='code ~/.dotfiles/zsh/.zshrc'
alias starshiprc='code ~/.dotfiles/starship/starship.toml'
alias dotfiles='code ~/.dotfiles'

# ==========================================
# Enhanced listing with eza (if available)
# ==========================================
if command -v eza >/dev/null 2>&1; then
    alias ls='eza --group-directories-first'
    alias ll='eza -la --group-directories-first --git'
    alias la='eza -la --group-directories-first'
    alias tree='eza --tree --level=2'
    alias ltree='eza --tree --level=3 -la'
fi

# ==========================================
# System shortcuts
# ==========================================
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'
alias h='history'
alias hg='history | grep'
alias psg='ps aux | grep'

# ==========================================
# Network utilities
# ==========================================
alias myip='curl -s https://httpbin.org/ip | jq -r .origin'
alias localip="ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print \$2}'"
alias ports='netstat -tuln'

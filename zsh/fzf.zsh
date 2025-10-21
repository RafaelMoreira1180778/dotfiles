# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  FZF Integration
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  Configuration
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/.*" -not -path "*/node_modules/*" -not -path "*/.git/*" 2>/dev/null'
export FZF_DEFAULT_OPTS="
  --height=40%
  --layout=reverse
  --border
  --info=inline
  --prompt='🔍 '
  --pointer='▶'
  --marker='✓'
  --bind='ctrl-/:toggle-preview'
  --bind='ctrl-u:preview-half-page-up'
  --bind='ctrl-d:preview-half-page-down'
  --bind='ctrl-a:select-all'
  --bind='ctrl-y:execute-silent(echo {} | pbcopy)'
"

export FZF_CTRL_T_COMMAND="find . -type f -not -path '*/.*' -not -path '*/node_modules/*' -not -path '*/.git/*' 2>/dev/null"
export FZF_ALT_C_COMMAND="find . -type d -not -path '*/.*' -not -path '*/node_modules/*' 2>/dev/null"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  History Search
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

fzf-history-widget() {
    local selected num
    selected=$(fc -rl 1 | awk '{$1=""; print substr($0,2)}' | fzf \
        --prompt='⚡ History: ' \
        --header='󰋚 Search command history' \
        --tac \
        --no-sort \
        --exact \
        --query="$LBUFFER")
    if [[ -n $selected ]]; then
        LBUFFER=$selected
    fi
    zle redisplay
}
zle -N fzf-history-widget

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  File Selection
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

fzf-file-widget() {
    local selected
    selected=$(eval "$FZF_CTRL_T_COMMAND" | fzf \
        --prompt='📁 Files: ' \
        --header='󰈞 Select files to insert' \
        --preview='[[ -f {} ]] && bat --color=always --style=numbers --line-range=:500 {} || [[ -d {} ]] && eza --tree --level=2 --color=always {} || echo "Preview not available"' \
        --preview-window=right:60%:wrap)
    if [[ -n $selected ]]; then
        LBUFFER="${LBUFFER}${selected}"
    fi
    zle redisplay
}
zle -N fzf-file-widget

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  Directory Navigation
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

fzf-cd-widget() {
    local selected
    selected=$(eval "$FZF_ALT_C_COMMAND" | fzf \
        --prompt='📂 Dirs: ' \
        --header='󰉋 Select directory to cd into' \
        --preview='eza --tree --level=2 --color=always {}' \
        --preview-window=right:50%:wrap)
    if [[ -n $selected ]]; then
        cd "$selected"
    fi
    zle reset-prompt
}
zle -N fzf-cd-widget

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  Process Killer
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

fzf-kill-process() {
    local pid
    pid=$(ps -ef | sed 1d | fzf \
        --prompt='💀 Kill: ' \
        --header='⚠️  Select process to terminate' \
        --preview='echo {}' \
        --preview-window=down:3:wrap \
        --bind='ctrl-r:reload(ps -ef | sed 1d)' | awk '{print $2}')

    if [[ -n $pid ]]; then
        echo "Killing process $pid..."
        kill -9 $pid
    fi
}
zle -N fzf-kill-process

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  FZF-TAB Configuration
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if [[ -n $TMUX ]]; then
    zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
else
    zstyle ':fzf-tab:*' fzf-command fzf
fi
zstyle ':fzf-tab:*' fzf-flags --height=50% --layout=reverse --border --info=inline --prompt='🚀 ' --pointer='▶' --marker='✓'
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-/:toggle-preview' 'ctrl-u:preview-half-page-up' 'ctrl-d:preview-half-page-down' 'ctrl-a:select-all' 'ctrl-y:execute-silent(echo {} | pbcopy)'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  FZF-TAB Completion Styles
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath 2>/dev/null || ls -1 $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'if [[ -f $realpath ]]; then bat --color=always --style=numbers --line-range=:500 $realpath 2>/dev/null || cat $realpath; elif [[ -d $realpath ]]; then eza --tree --level=2 --color=always $realpath 2>/dev/null || ls -la $realpath; fi'

# Give a preview when completing `kill`
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │                                                                               │
# │                  Initialize Completion (After Plugins Load)                  │
# │                                                                               │
# └─────────────────────────────────────────────────────────────────────────────┘

# This MUST run AFTER all plugins are loaded (especially fzf-tab)
autoload -U compinit && compinit -i

# Kubecolor uses kubectl completions
compdef kubecolor=kubectl

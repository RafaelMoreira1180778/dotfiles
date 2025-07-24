# ==========================================
# History Configuration
# ==========================================
# ZSH history settings for optimal command tracking

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000                    # Large history for current session
SAVEHIST=50000                    # Large history saved to file

# History options
setopt HIST_IGNORE_DUPS          # Don't save duplicate commands
setopt HIST_IGNORE_ALL_DUPS      # Remove older duplicate commands
setopt HIST_IGNORE_SPACE         # Don't save commands starting with space
setopt HIST_SAVE_NO_DUPS         # Don't save duplicate commands to file
setopt HIST_REDUCE_BLANKS        # Remove extra blanks from commands
setopt HIST_VERIFY               # Show command before executing from history
setopt SHARE_HISTORY             # Share history between sessions
setopt APPEND_HISTORY            # Append to history file
setopt INC_APPEND_HISTORY        # Add commands to history immediately

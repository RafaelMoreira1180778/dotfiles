# ==========================================
# ZSH Options for Better UX
# ==========================================
# Shell behavior and user experience settings

# ==========================================
# Directory Navigation
# ==========================================
setopt AUTO_CD                   # Change directory by typing directory name
setopt AUTO_PUSHD                # Automatically push directories to stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicate directories
setopt PUSHD_SILENT              # Don't print directory stack after pushd/popd

# ==========================================
# Completion Behavior
# ==========================================
setopt CORRECT                   # Command correction
setopt COMPLETE_IN_WORD          # Complete from both ends of word
setopt ALWAYS_TO_END             # Move cursor to end after completion
setopt AUTO_MENU                 # Show completion menu on tab
setopt AUTO_LIST                 # List choices on ambiguous completion
setopt AUTO_PARAM_SLASH          # Add slash after directory completion
setopt LIST_PACKED               # Use variable column widths in completion

# ==========================================
# Globbing and Pattern Matching
# ==========================================
setopt EXTENDED_GLOB             # Extended globbing patterns
setopt GLOB_DOTS                 # Include dotfiles in glob patterns
setopt NUMERIC_GLOB_SORT         # Sort numeric filenames numerically

# ==========================================
# Job Control
# ==========================================
setopt AUTO_RESUME               # Resume jobs with command name
setopt LONG_LIST_JOBS            # Show job info in verbose format
setopt NOTIFY                    # Report job status immediately

# ==========================================
# Input/Output
# ==========================================
setopt INTERACTIVE_COMMENTS      # Allow comments in interactive shell
setopt RC_QUOTES                 # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
setopt COMBINING_CHARS           # Handle combining characters properly

# ==========================================
# Safety
# ==========================================
unsetopt CLOBBER                 # Don't overwrite files with > redirection
setopt RM_STAR_WAIT              # Wait 10 seconds before executing rm *

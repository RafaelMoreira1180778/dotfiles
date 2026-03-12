# ⚡ Modern ZSH Configuration

[![Zsh](https://img.shields.io/badge/Zsh-5.9-4E9A06?logo=gnu-bash&logoColor=white)](https://www.zsh.org/)
[![Starship](https://img.shields.io/badge/Starship-1.17-DD0B78?logo=starship&logoColor=white)](https://starship.rs/)
[![FZF](https://img.shields.io/badge/FZF-0.46-019733?logo=fuzzy&logoColor=white)](https://github.com/junegunn/fzf)
[![Zoxide](https://img.shields.io/badge/Zoxide-Smart%20Navigation-FF6B6B?logo=rust&logoColor=white)](https://github.com/ajeetdsouza/zoxide)
[![Homebrew](https://img.shields.io/badge/Homebrew-macOS-FBB040?logo=homebrew&logoColor=black)](https://brew.sh/)
[![Direnv](https://img.shields.io/badge/Direnv-Environment-FF69B4?logo=environment&logoColor=white)](https://direnv.net/)
[![Python](https://img.shields.io/badge/Python-3.12+-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![UV](https://img.shields.io/badge/UV-Package%20Manager-FFC527?logo=pip&logoColor=black)](https://astral.sh/blog/uv)
[![AWS](https://img.shields.io/badge/AWS-Configured-FF9900?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

> *99% vibe coded, as all things should be* ✨

macOS-first dotfiles for developers who value speed and simplicity. Fast Zsh setup with modular configs, Starship prompt, FZF, and smart navigation.

## 🚀 What You Get

**Blazing Fast**: No plugin manager overhead, single-file `.zshrc` with brew-based tools
**Smart Completion**: Brew completions for all tools, context-aware suggestions
**Beautiful Prompt**: Starship prompt with git integration and instant feedback
**Fuzzy Everything**: FZF for files, history, and directory navigation
**Smart Navigation**: Zoxide learns your patterns, auto-cd to frequently visited directories
**Developer Ready**: Python (UV), Docker, Kubernetes, AWS CLI pre-configured
**Auto Python venv**: Automatically activates `.venv` or `venv` when entering project directories
**Massive History**: 50,000 commands with deduplication

## 📋 What You Need

- macOS (tested on Ventura+)
- Terminal emulator (iTerm2, Terminal.app, or any modern terminal)
- Homebrew installed

## 🛠️ Quick Setup

```bash
# Clone and navigate
git clone https://github.com/RafaelMoreira1180778/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run setup (installs dependencies and generates completions)
./setup.sh

# Reload shell
source ~/.zshrc
```

**That's it!** 🎉

## ⚙️ Structure

```
~/.dotfiles/
├── setup.sh              # Automated setup script
├── .zshenv               # Environment setup (runs first, always loaded)
├── .zprofile             # Login shell PATH fixes (after macOS path_helper)
├── .zshrc                # All-in-one interactive shell configuration
├── local.zshenv          # Machine-specific environment (gitignored)
├── zsh/
│   └── local.zsh         # Machine-specific interactive config (gitignored)
├── starship/
│   └── starship.toml     # Starship prompt configuration
└── ~/.zsh_history        # Shell history (50,000 commands)
```

**What's in `.zshrc`** (consolidated single file):
- Environment variables (EDITOR, AWS, Python, etc.)
- History configuration (50K commands, deduplication)
- Shell options (auto-cd, globbing, completion)
- Completion system (Homebrew, case-insensitive)
- Aliases (eza, bat, safety aliases)
- Tool initialization (Starship, Zoxide, Direnv, FZF, mise)
- Python venv auto-activation
- Sources `zsh/local.zsh` for machine-specific overrides

**Startup order (login shell)**:
1. `/etc/zshenv` (system)
2. `~/.zshenv` → Sets minimal PATH, sources `local.zshenv`
3. `/etc/zprofile` → macOS `path_helper` reorders PATH
4. `~/.zprofile` → Fixes PATH order
5. `~/.zshrc` → All interactive config, sources `zsh/local.zsh`

## ⌨️ Key Bindings

| Binding    | Action                       |
| ---------- | ---------------------------- |
| **Ctrl+R** | FZF history search           |
| **Ctrl+T** | FZF file finder with preview |
| **Alt+C**  | FZF directory navigation     |

## 🎨 Customization

### Machine-Specific Environment (`local.zshenv`)

Create `~/.dotfiles/local.zshenv` for machine-specific **environment variables and PATH**:

```bash
# Example: LaTeX/Perl configuration
export PATH="/opt/homebrew/opt/perl/bin:/Library/TeX/texbin:$PATH"
unset PERL5LIB

# Example: Custom AWS region
export AWS_DEFAULT_REGION="us-east-1"

# Example: RVM
export PATH="$PATH:$HOME/.rvm/bin"
```

**Important**: `local.zshenv` runs for **ALL** shells (including VSCode extensions, LaTeX Workshop). Only use environment variables and PATH here.

### Machine-Specific Interactive Config (`zsh/local.zsh`)

Create `~/.dotfiles/zsh/local.zsh` for **aliases, functions, and interactive features**:

```bash
# Example: Custom aliases
alias kubectl="kubecolor"
alias k="kubecolor"

# Example: Override editor
export EDITOR="vim"
```

**Important**: `local.zsh` only runs for interactive shells (iTerm2, Terminal.app). Not loaded by VSCode extensions.

## 🛠️ Available Features

**Python Virtual Environments**
- Auto-activates `.venv` or `venv` when entering project directories
- Auto-deactivates when leaving project directories
- No manual activation needed

**Modern Command Replacements**
```bash
ls → eza          # Modern ls with git integration
cat → bat         # Cat with syntax highlighting
cd → zoxide       # Smart directory navigation
```

**FZF Integration**
- `Ctrl+R` - Search command history
- `Ctrl+T` - Find files
- `Alt+C` - Navigate directories

## 📚 Built With

- **[Starship](https://starship.rs/)** - Cross-shell prompt with git integration
- **[FZF](https://github.com/junegunn/fzf)** - Command-line fuzzy finder
- **[Zoxide](https://github.com/ajeetdsouza/zoxide)** - Smarter cd command
- **[Eza](https://github.com/eza-community/eza)** - Modern ls replacement
- **[Bat](https://github.com/sharkdp/bat)** - Cat with syntax highlighting
- **[Direnv](https://direnv.net/)** - Environment switcher for the shell
- **[UV](https://astral.sh/blog/uv)** - Fast Python package manager
- **[Mise](https://mise.jdx.dev/)** - Universal version manager

## 📋 License

MIT License - See [LICENSE](LICENSE) for details.

---

Made with ☕ and ✨ for developers who care about their terminal

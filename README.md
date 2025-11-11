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

**Blazing Fast**: No plugin manager overhead, pure Zsh with brew-based tools  
**Smart Completion**: Brew completions for all tools, context-aware suggestions  
**Beautiful Prompt**: Starship prompt with git integration and instant feedback  
**Fuzzy Everything**: FZF for files, history, and directory navigation  
**Smart Navigation**: Zoxide learns your patterns, auto-cd to frequently visited directories  
**Developer Ready**: Python (UV), Docker, Kubernetes, AWS CLI pre-configured  
**Massive History**: 50,000 commands with deduplication, stored in `~/.zsh/cache/HISTFILE`

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
├── zsh/
│   ├── .zshenv           # Environment setup (runs first, sets PATH)
│   ├── .zshrc            # Main interactive shell configuration
│   ├── exports.zsh       # Environment variables
│   ├── config.zsh        # History, options, aliases, keybindings
│   ├── completions.zsh   # Tab completion system
│   ├── functions.zsh     # Custom functions (AWS, EKS)
│   ├── tools.zsh         # Tool initialization (zoxide, direnv, starship)
│   └── local.zsh         # Local/machine-specific config (gitignored)
├── starship/
│   └── starship.toml     # Starship prompt configuration
└── ~/.zsh/
    └── cache/
        ├── completions/  # Generated completions (_kubectl, _docker, _helm)
        └── HISTFILE      # Shell history
```

**Startup order (login shell)**:
1. `/etc/zshenv` (system)
2. `~/.zshenv` → Sets up PATH for Homebrew & tools
3. `~/.zshrc` → Sources all configuration modules

**Modules are sourced in order**:
`exports.zsh` → `config.zsh` → `tools.zsh` → `functions.zsh` → `completions.zsh` → `local.zsh`

## ⌨️ Key Bindings

| Binding    | Action                       |
| ---------- | ---------------------------- |
| **Ctrl+R** | FZF history search           |
| **Ctrl+T** | FZF file finder with preview |
| **Alt+C**  | FZF directory navigation     |

## 🎨 Customization

**Local machine config**: Create `~/.dotfiles/zsh/local.zsh` for machine-specific settings (gitignored)

```bash
export CUSTOM_VAR="value"
alias myalias="command"

# Example: Custom aliases
alias kubectl="kubecolor"
alias k="kubecolor"
```

## 🛠️ Available Commands

**AWS Profile Management**
```bash
export_aws_profile [profile-name]  # Set AWS profile (optional fzf picker)
update_eks [--all]                 # Update kubeconfig for EKS clusters
```

**Python Virtual Environments**
```bash
# Auto-activates venv or .venv on cd (no command needed)
```

## 📚 Built With

- **[Starship](https://starship.rs/)** - Cross-shell prompt with git integration
- **[FZF](https://github.com/junegunn/fzf)** - Command-line fuzzy finder
- **[Zoxide](https://github.com/ajeetdsouza/zoxide)** - Smarter cd command
- **[Eza](https://github.com/eza-community/eza)** - Modern ls replacement
- **[Bat](https://github.com/sharkdp/bat)** - Cat with syntax highlighting
- **[Direnv](https://direnv.net/)** - Environment switcher for the shell
- **[UV](https://astral.sh/blog/uv)** - Fast Python package manager
- **[ASDF](https://asdf-vm.com/)** - Universal version manager

## 📋 License

MIT License - See [LICENSE](LICENSE) for details.

---

Made with ☕ and ✨ for developers who care about their terminal

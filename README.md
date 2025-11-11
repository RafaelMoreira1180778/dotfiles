# ⚡ Modern ZSH Configuration

[![Zsh](https://img.shields.io/badge/Zsh-5.9-4E9A06?logo=gnu-bash&logoColor=white)](https://www.zsh.org/)
[![Starship](https://img.shields.io/badge/Starship-1.17-DD0B78?logo=starship&logoColor=white)](https://starship.rs/)
[![FZF](https://img.shields.io/badge/FZF-0.46-019733?logo=fuzzy&logoColor=white)](https://github.com/junegunn/fzf)
[![Zoxide](https://img.shields.io/badge/Zoxide-Smart%20Navigation-FF6B6B?logo=rust&logoColor=white)](https://github.com/ajeetdsouza/zoxide)
[![Homebrew](https://img.shields.io/badge/Homebrew-macOS-FBB040?logo=homebrew&logoColor=black)](https://brew.sh/)
[![Zinit](https://img.shields.io/badge/Zinit-Plugin%20Manager-2E8B57?logo=zsh&logoColor=white)](https://github.com/zdharma-continuum/zinit)
[![Direnv](https://img.shields.io/badge/Direnv-Environment-FF69B4?logo=environment&logoColor=white)](https://direnv.net/)
[![Python](https://img.shields.io/badge/Python-3.12+-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![UV](https://img.shields.io/badge/UV-Package%20Manager-FFC527?logo=pip&logoColor=black)](https://astral.sh/blog/uv)
[![AWS](https://img.shields.io/badge/AWS-Configured-FF9900?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

> *99% vibe coded, as all things should be* ✨

macOS-first dotfiles for developers who value speed and aesthetics. Fast Zsh setup with modular configs, Starship prompt, FZF, and smart navigation.

## 🚀 What You Get

**Blazing Fast**: Optimized plugin loading with Zinit's lazy-loading  
**Smart Completion**: FZF-Tab with file/directory previews, context-aware suggestions  
**Beautiful Prompt**: Starship prompt with git integration and instant feedback  
**Fuzzy Everything**: FZF for files, history, and directory navigation  
**Smart Navigation**: Zoxide learns your patterns, auto-cd to frequently visited directories  
**Developer Ready**: Python (UV), Docker, Kubernetes, Git tools pre-configured  
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

# Run setup
./setup.sh

# Reload shell
source ~/.zshrc
```

**That's it!** 🎉

Optionally verify everything works:
```bash
./verify.sh
```

## ⚙️ Structure

```
~/.dotfiles/
├── setup.sh              # Automated setup script
├── verify.sh             # Installation verification
├── zsh/
│   ├── .zshenv           # Environment setup (runs first, sets PATH)
│   ├── .zshrc            # Main interactive shell configuration
│   ├── exports.zsh       # Environment variables & PATH
│   ├── history.zsh       # History settings (50k commands, .zsh/cache/HISTFILE)
│   ├── options.zsh       # ZSH shell options
│   ├── plugins.zsh       # Zinit plugin manager & setup
│   ├── completions.zsh   # Tab completion system & FZF-Tab
│   ├── fzf.zsh           # FZF integration & keybindings
│   ├── aliases.zsh       # Command aliases
│   ├── keybindings.zsh   # Custom key bindings
│   ├── functions.zsh     # Custom functions (AWS, EKS, completions refresh)
│   ├── tools.zsh         # Tool initialization (zoxide, direnv)
│   ├── local.zsh         # Local/machine-specific config (gitignored)
│   └── completions_cache/ # Tool completions (kubectl, docker, helm)
├── starship/
│   └── starship.toml     # Starship prompt configuration
└── ~/.zsh/
    ├── cache/
    │   ├── completions/  # Completion cache
    │   └── HISTFILE      # Shell history
```

**Startup order (login shell)**:
1. `/etc/zshenv` (system)
2. `~/.zshenv` → Sets up PATH for Homebrew & tools
3. `~/.zshrc` → Sources all configuration modules

**Modules are sourced in order**:
`options.zsh` → `exports.zsh` → `history.zsh` → `completions.zsh` → `aliases.zsh` → `plugins.zsh` → `tools.zsh` → `fzf.zsh` → `functions.zsh` → `local.zsh`

## ⌨️ Key Bindings

| Binding      | Action                       |
| ------------ | ---------------------------- |
| **Ctrl+R**   | FZF history search           |
| **Ctrl+T**   | FZF file finder with preview |
| **Alt+C**    | FZF directory navigation     |
| **Ctrl+X+K** | Interactive process killer   |

## 🎨 Customization

**Local machine config**: Create `~/.dotfiles/zsh/local.zsh` for machine-specific settings (gitignored)

```bash
export CUSTOM_VAR="value"
alias myalias="command"

# Example: KN-specific proxy settings
enable_proxy  # Activates configured proxy
```

**Add plugins**: Edit `zsh/plugins.zsh`

```bash
zinit light user/plugin-name
```

## 🛠️ Available Commands

**AWS Profile Management**
```bash
export_aws_profile [profile-name]  # Set AWS profile (optional fzf picker)
update_eks [--all]                 # Update kubeconfig for EKS clusters
```

**Completion Management**
```bash
refresh_completions  # Cache kubectl, docker, helm completions to ~/.zsh/cache/completions
```

**Python Virtual Environments**
```bash
# Auto-activates venv or .venv on cd (no command needed)
```

## 📚 Built With

- **[Zinit](https://github.com/zdharma-continuum/zinit)** - Blazing fast plugin manager
- **[Starship](https://starship.rs/)** - Cross-shell prompt with git integration
- **[FZF](https://github.com/junegunn/fzf)** - Command-line fuzzy finder
- **[Zoxide](https://github.com/ajeetdsouza/zoxide)** - Smarter cd command
- **[Eza](https://github.com/eza-community/eza)** - Modern ls replacement
- **[Direnv](https://direnv.net/)** - Environment switcher for the shell

**Plugins**: zsh-completions, zsh-syntax-highlighting, zsh-autosuggestions, fzf-tab

## 📋 License

MIT License - See [LICENSE](LICENSE) for details.

---

Made with ☕ and ✨ for developers who care about their terminal

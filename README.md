# ⚡ Modern ZSH Configuration

[![Zsh](https://img.shields.io/badge/Zsh-5.9-4E9A06?logo=gnu-bash&logoColor=white)](https://www.zsh.org/)
[![Starship](https://img.shields.io/badge/Starship-1.17-DD0B78?logo=starship&logoColor=white)](https://starship.rs/)
[![FZF](https://img.shields.io/badge/FZF-0.46-019733?logo=fuzzy&logoColor=white)](https://github.com/junegunn/fzf)
[![Homebrew](https://img.shields.io/badge/Homebrew-macOS-FBB040?logo=homebrew&logoColor=black)](https://brew.sh/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

> *99% vibe coded, as all things should be* ✨

macOS-first dotfiles for developers who value speed and aesthetics. Fast Zsh setup with modular configs, Starship prompt, FZF, and smart navigation.

## 🚀 What You Get

**Blazing Fast**: ~50-100ms startup with optimized plugin loading  
**Smart Completion**: Tab completion with Homebrew integration and context-aware suggestions  
**Beautiful Prompt**: Starship prompt with git integration and instant feedback  
**Fuzzy Everything**: FZF for files, history, and directory navigation  
**Smart Navigation**: Zoxide learns your patterns, auto-cd to directories  
**Developer Ready**: Python (UV), Docker, Kubernetes, Git tools pre-configured  
**Massive History**: 50,000 commands with deduplication and instant search

## 📋 What You Need

- macOS (tested on Ventura+)
- Terminal emulator (Ghostty, iTerm2, or default Terminal.app)
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
│   ├── .zshenv           # Environment setup (runs first)
│   ├── .zshrc            # Main configuration
│   ├── exports.zsh       # Environment variables & PATH
│   ├── history.zsh       # History settings
│   ├── options.zsh       # ZSH options
│   ├── plugins.zsh       # Plugin management & completion init
│   ├── completions.zsh   # Tab completion system
│   ├── fzf.zsh          # FZF integration
│   ├── aliases.zsh       # Command aliases
│   ├── keybindings.zsh   # Key bindings
│   ├── functions.zsh     # Custom functions
│   ├── tools.zsh         # Tool initialization (zoxide, direnv)
│   └── local.zsh         # Local machine-specific config (gitignored)
├── starship/
│   └── starship.toml     # Prompt configuration
└── ghostty/
    └── config            # Terminal configuration (optional)
```

**Loading order**: `.zshenv` → `.zshrc` → plugins → completions → tools → local overrides

## ⌨️ Key Bindings

| Binding        | Action                               |
| -------------- | ------------------------------------ |
| **Ctrl+R**     | FZF history search                   |
| **Ctrl+T**     | FZF file finder with preview         |
| **Alt+C**      | FZF directory navigation             |
| **Ctrl+X+K**   | Interactive process killer           |

## 🎨 Customization

**Local machine config**: Create `~/.dotfiles/zsh/local.zsh` for machine-specific settings (gitignored)

```bash
export CUSTOM_VAR="value"
alias myalias="command"
```

**Add plugins**: Edit `zsh/plugins.zsh`

```bash
zinit light user/plugin-name
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

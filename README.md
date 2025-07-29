# Modern ZSH Configuration

⚡️ macOS-first dotfiles for developers. Fast Zsh setup with modular configs, Starship prompt, FZF, and smart navigation. Optimized for Python, Docker, and Git. 

## Features

- **⚡ Fast startup** - Optimized plugin loading (~50-100ms)
- **🔍 Smart completion** - Enhanced tab completion with Homebrew integration
- **🎯 Auto-suggestions** - Context-aware suggestions based on history
- **🌈 Syntax highlighting** - Real-time command syntax highlighting
- **📁 Smart navigation** - Zoxide for intelligent directory jumping
- **🚀 Beautiful prompt** - Starship prompt with git integration
- **📚 Large history** - 50,000 command history with deduplication
- **🔍 FZF integration** - Modern fuzzy finder for files and history
- **🛠️ Developer tools** - Optimized for Python, Docker, and Git

## Quick Setup

1. **Clone this repository**:

   ```bash
   git clone <repository-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the setup script**:

   ```bash
   ./setup.sh
   ```

3. **Restart your terminal** or reload:

   ```bash
   source ~/.zshrc
   ```

4. **Verify installation** (optional):
   ```bash
   ./verify.sh
   ```

## Structure

```
~/.dotfiles/
├── setup.sh              # Automated setup script
├── verify.sh             # Installation verification
├── zsh/
│   ├── .zshrc            # Main configuration
│   ├── exports.zsh       # Environment variables
│   ├── history.zsh       # History settings
│   ├── options.zsh       # ZSH options
│   ├── plugins.zsh       # Plugin management
│   ├── completions.zsh   # Tab completion
│   ├── fzf.zsh          # FZF integration
│   ├── aliases.zsh       # Command aliases
│   ├── keybindings.zsh   # Key bindings
│   ├── functions.zsh     # Custom functions
│   └── local.zsh         # Local machine-specific config (gitignored)
├── starship/
│   └── starship.toml     # Prompt configuration
└── ghostty/
    └── config            # Terminal configuration
```

## Key Features

### Tab Completion

- Native ZSH completions with Homebrew integration
- Menu selection with colored output
- Smart caching and case-insensitive matching

### FZF Integration

- **Ctrl+R**: History search with modern interface
- **Ctrl+T**: File finder with syntax highlighting preview
- **Alt+C**: Directory navigation with tree preview
- **Ctrl+X+Ctrl+K**: Interactive process killer

### Smart Navigation

- Zoxide for intelligent directory jumping
- Auto-cd functionality
- Learning based on usage patterns
- Direnv for environment variables per directory

## Customization

### Local Configuration

Create `~/.dotfiles/zsh/local.zsh` for machine-specific settings:

```bash
export CUSTOM_VAR="value"
alias myalias="command"
```

This file is automatically sourced at the end of the ZSH configuration and is gitignored for local customization.

### Adding Plugins

Edit `zsh/plugins.zsh` to add new Zinit plugins:

```bash
zinit light user/plugin-name
```

## Included Tools

| Tool         | Purpose                                 |
| ------------ | --------------------------------------- |
| **Zinit**    | Plugin manager with fast loading        |
| **Starship** | Beautiful prompt with git integration   |
| **FZF**      | Fuzzy finder for files and history      |
| **Zoxide**   | Smart directory jumping                 |
| **Eza**      | Modern `ls` replacement                 |
| **Bat**      | Enhanced `cat` with syntax highlighting |
| **Volta**    | Node version manager                    |
| **Pyenv**    | Python verrsion manager                 |
| **Direnv**   | Environment variables per directory     |

## Performance

- Cold startup: ~100ms
- Warm startup: ~50ms
- 50,000 command history with instant search

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - see [LICENSE](LICENSE) file for details.

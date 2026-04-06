# nvim
Configuration files for nvim based on kickstart.
# Neovim Configuration

A modern, feature-rich Neovim configuration with LSP support, tree-sitter syntax highlighting, telescope fuzzy finding, and a beautiful customizable theme system.

## 📋 Requirements

- **Neovim v0.12.0 or higher** (required for LSP features)
- **Git** (for plugin management)
- **Nerd Font** (for icons) - JetBrainsMono Nerd Font recommended
- **Make** (for building telescope-fzf-native)
- **Node.js** (for TypeScript/JavaScript LSP)
- **Python** (for Python LSP and formatters)
- **Go** (for Go LSP, optional)
- **Rust** (for Rust LSP, optional)
- **Clang** (for C/C++ LSP, optional)

## 🚀 Installation

### 1. Install Neovim 0.12.0+

```bash
# Ubuntu/Debian
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# macOS
brew install neovim

# Arch Linux
sudo pacman -S neovim
```
# Or download from releases
# https://github.com/neovim/neovim/releases/tag/v0.12.0


### 2. Install Nerd Font
 - Requres for icons.
 ```bash
 # Create fonts directory
mkdir -p ~/.local/share/fonts

# Download JetBrainsMono Nerd Font (v3.3.0)
curl -fLo /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip

# Extract to fonts directory
unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono

# Update font cache
fc-cache -fv

# Clean up
rm /tmp/JetBrainsMono.zip

# Set your terminal to use "JetBrainsMono Nerd Font"
 ```

### 3. Clone Configuration
```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Clone the configuration
git clone https://github.com/igr47/nvim.git ~/.config
```

### 4. Launch Neovim
- You can just start nvim.
```bash
nvim +Lazy sync +qa
```
-The first launch will automatically install all plugins and language servers. This may take a few minutes.

### 🎨 Features 
### Core Features
- LSP Support - C++, Rust, Go, Python, TypeScript/JavaScript, SQL, Lua

- Tree-sitter - Syntax highlighting for 25+ languages

- Telescope - Fuzzy finding for files, grep, diagnostics, and more

- Git Integration - Fugitive, Gitsigns, and Neotree Git status

- Autocompletion - Intelligent completions with snippets

- File Explorer - Neo-tree with Git and diagnostics support

- Buffer Management - Bufferline with beautiful tabs

- Theme System - Switch between 4 themes with transparency toggle

### Language Servers (Auto-installed)
    Language	    LSP Server	    Formatter   
    C/C++	        clangd	        clang-format
    Rust	        rust-analyzer	rustfmt
    Go	            gopls gofumpt,  goimports
    Python	        pyright black,  isort
    TypeScript/JS	ts_ls	        prettier
    SQL	            sqlls	        -
    Lua	            lua_ls	        stylua

### ⌨️ Key Mappings

### General
    Key	            Action
    <C-s>	        Save file
    <C-q>	        Quit
    <C-d> / <C-u>	Scroll down/up (centered)
    n / N	        Next/previous search (centered)
    x	            Delete character (without yanking)

### Buffer Management
    Key	        Action
    <Tab>	    Next buffer
    <S-Tab>	    Previous buffer
    <leader>x	Close current buffer
    <leader>b	Create new buffer

### Window Management
    Key	        Action
    <leader>v	Vertical split
    <leader>h	Horizontal split
    <leader>se	Equalize splits
    <leader>xs	Close split
    <C-h/j/k/l>	Navigate splits

### Tabs
    Key	        Action
    <leader>to	New tab
    <leader>tx	Close tab
    <leader>tn	Next tab
    <leader>tp	Previous tab

### File Explorer (Neo-tree)
    Key	        Action
    <leader>e	Toggle file explorer
    \	        Reveal current file
    <leader>ngs	Open Git status float

### Telescope (Fuzzy Finding)
    Key	                Action
    <leader>sf	        Find files
    <leader>sg	        Live grep
    <leader>sw	        Search current word
    <leader>sh	        Search help
    <leader>sk	        Search keymaps
    <leader>sd	        Search diagnostics
    <leader>sr	        Resume last search
    <leader><leader>	Find existing buffers
    <leader>/	        Fuzzy find in current buffer

### LSP (Language Server Protocol)
    Key	        Action
    gd	        Go to definition
    gr	        Find references
    gI	        Go to implementation
    <leader>D	Go to type definition
    <leader>ds	Document symbols
    <leader>ws	Workspace symbols
    <leader>rn	Rename symbol
    <leader>ca	Code action
    gD	        Go to declaration
    [d / ]d	    Previous/next diagnostic
    <leader>d	Open diagnostic float
    <leader>q	Open diagnostic list
    <leader>th	Toggle inlay hints

### Theme Management
    Key	        Action
    <leader>tn	Tokyo Night theme
    <leader>nd	Nord theme
    <leader>gv	Gruvbox theme
    <leader>mn	Monokai Pro theme
    <leader>bg	Toggle transparency
    <leader>th	Show theme help

### Git (Fugitive)
    Key	        Action
    <leader>gs	Git status
    <leader>gd	Git diff
    <leader>gb	Git blame
    <leader>gl	Git log

### 🎨 Theme System
- The configuration includes 4 beautiful themes with transparency support:

- Tokyo Night (default) - Dark theme with vibrant colors

- Nord - Arctic, blue-based theme

- Gruvbox - Retro, warm theme

- Monokai Pro - Classic colorful theme

- All themes support:

- Transparent background (toggle with <leader>bg)

- Lualine theme synchronization

- Bufferline theming

- Neo-tree theming

### 🔧 Customization
### Adding New Language Servers
- Edit lsp.lua and add your server to the servers table:
```lua
your_language = {
    capabilities = capabilities,
    cmd = { 'your-language-server' },
    filetypes = { 'yourfiletype' },
    settings = {
    -- Your server settings
    },
}
```

### Changing Default Theme
- Edit colortheme.lua and change the active theme in the Tokyo Night config:
```lua
-- Change from 'night' to 'storm', 'day', or 'moon'
style = 'storm'
```

### Modifying Key Mappings
- Edit keymaps.lua to add or modify mappings:
```lua
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
```
### Included Plugins
    Plugin	                Purpose
    nvim-treesitter	        Syntax highlighting
    nvim-lspconfig	        LSP configuration
    nvim-cmp	            Autocompletion
    telescope.nvim	        Fuzzy finding
    neo-tree.nvim	        File explorer
    bufferline.nvim	        Buffer tabs
    lualine.nvim	        Status line
    gitsigns.nvim	        Git signs
    vim-fugitive	        Git integration
    tokyonight.nvim	        Theme
    indent-blankline.nvim	Indentation guides

### 🐛 Troubleshooting

### Check Neovim Version
```bash
nvim --version
# Must show v0.12.0 or higher
```
### Reinstall All Language Servers
```bash
:Mason
# Press 'i' to install missing servers
# Or run in Neovim:
:MasonInstallAll
```

### Update All Plugins
```bash
:Lazy sync
```

### Check LSP Status
```bash
:LspInfo
```

### Fix Telescope FZF Native
```bash
cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
make
```

### Font Icons Not Showing
- Verify Nerd Font is installed: fc-list | grep "JetBrainsMono Nerd Font"

- Ensure your terminal emulator is using the correct font

- Try setting in terminal preferences: "JetBrainsMono Nerd Font"

### Transparency Not Working
- Ensure your terminal emulator supports transparency

- Some terminals require compositor (picom, etc.)


### 🤝 Contributing
- Feel free to open issues or submit pull requests for improvements.

### 🙏 Acknowledgments
- ThePrimeagen - Inspiration

- kickstart.nvim - Base configuration

-All plugin authors for their amazing work

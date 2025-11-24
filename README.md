# My Neovim Config

It all began because I thought it looked cool, but then I started to realize that Vim motions — and the understanding that Vim/Neovim gave me — were actually really helpful.
In the beginning, I used LazyVim and later tried LunarVim for a while, but there were too many features I didn’t even understand, so I decided to create my own configuration.

## Features

- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and efficient plugin loading
- **LSP Support**: Full Language Server Protocol integration with Mason for easy management
- **Fuzzy Finding**: Telescope for quick file navigation and searching
- **LaTeX Support**: Comprehensive LaTeX editing with VimTeX and custom templates
- **Syntax Highlighting**: Tree-sitter for accurate and fast syntax highlighting
- **Terminal Integration**: Integrated terminal with ToggleTerm
- **Auto-completion**: Smart auto-pairing of brackets and quotes

## Requirements

- Neovim >= 0.10.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Ripgrep (for Telescope live grep)
- Node.js (for some LSP servers)
- A C compiler (for Tree-sitter)

## Installation

1. **Backup your existing Neovim configuration (if any):**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository:**
   ```bash
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install all plugins on first launch.

4. **Install LSP servers:**
   After plugins are installed, open Mason:
   ```vim
   :Mason
   ```
   The configured language servers will be automatically installed.

## Structure

```
~/.config/nvim/
├── init.lua                  # Main entry point
├── lazy-lock.json           # Plugin version lock file
├── lua/
│   ├── config/
│   │   ├── options.lua      # Neovim options and settings
│   │   ├── keymaps.lua      # Custom keybindings
│   │   └── latex_templates.lua  # LaTeX template management
│   ├── lazy_setup.lua       # Lazy.nvim plugin manager setup
│   └── plugins/             # Individual plugin configurations
│       ├── masonlsp.lua     # LSP configuration with Mason
│       ├── telescope.lua    # Fuzzy finder configuration
│       ├── treesitter.lua   # Syntax highlighting
│       ├── vimtex.lua       # LaTeX support
│       ├── autopairs.lua    # Auto-pair brackets
│       ├── toggleterm.lua   # Terminal integration
│       ├── tokyonight.lua   # Color scheme
│       └── ultisnips.lua    # Snippet engine
├── latex-templates/         # Custom LaTeX templates
│   ├── main-article.tex
│   ├── chapter-article.tex
│   └── free_writing.tex
└── UltiSnips/              # Custom snippets
    └── tex.snippets        # LaTeX snippets
```

## Core Configuration

### Options (lua/config/options.lua)

- **Leader key**: Space
- **Line numbers**: Enabled with relative numbers
- **Indentation**: 4 spaces (spaces, not tabs)
- **Mouse**: Enabled for all modes
- **Clipboard**: Synced with system clipboard
- **Line wrap**: Disabled for cleaner code viewing
- **Color column**: Vertical line at column 90 (except on startup screen)
- **No swap/backup files**: Clean working directory, no annoying backup files
- **Write protection**: Disabled to allow direct file overwriting

### Language Support

Configured LSP servers via Mason:

- **Python**: Pyright
- **C/C++**: clangd
- **LaTeX**: texlab
- **Julia**: julials
- **R**: r_language_server

### Key Mappings

**Leader Key**: `Space`

#### General Keybindings

| Key | Action |
|-----|--------|
| `<leader><leader>` | Open file search (Telescope) |
| `<leader>w` | Save file |
| `<leader>q` | Close current buffer |
| `<leader>Q` | Quit all |
| `<leader>nf` | Create new empty file |
| `<leader>n` | Create new file (with name prompt) |
| `<leader>tt` | Open terminal in split |
| `<leader>rw` | Replace current word globally |
| `<leader>ss` | Search for visually selected text |
| `<Esc>` | Clear search highlighting |

#### Visual Mode

| Key | Action |
|-----|--------|
| `<` | Indent left (stay in visual mode) |
| `>` | Indent right (stay in visual mode) |
| `J` | Move selected lines down |
| `K` | Move selected lines up |
| `d` | Delete without yanking |

#### Normal Mode Enhancements

| Key | Action |
|-----|--------|
| `J` | Add empty line below |
| `U` | Add empty line above |
| `d`, `D`, `dd` | Delete without yanking (preserves yank buffer) |

#### LSP Keybindings

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format document |

#### Competitive Programming

| Key | Action |
|-----|--------|
| `<leader>cf` | Insert Codeforces template |

## Plugins

### Essential Plugins

- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: Plugin manager
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: LSP server installer
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Advanced syntax highlighting
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Fuzzy finder
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)**: Color scheme

### Writing & Development

- **[vimtex](https://github.com/lervag/vimtex)**: LaTeX editing
- **[UltiSnips](https://github.com/SirVer/ultisnips)**: Snippet engine
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Auto-close brackets
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: Terminal toggle

## LaTeX Workflow

This configuration includes custom LaTeX templates accessible via commands:

- `:LoadMainArticle` - Load main article template
- `:LoadChapterArticle` - Load chapter article template
- `:LoadFreeWriting` - Load free writing template

Templates are stored in `latex-templates/` and can be customized.

## Things I like

1. **Open a project:**
   ```bash
   cd your-project
   nvim .
   ```

2. **Find files quickly:**
   Press `<leader><leader>` (Space twice) to open Telescope file finder

3. **LSP features:**
   - Hover over any function/variable and press `K` for documentation
   - Use `gd` to jump to definitions
   - Use `<leader>ca` for code actions (imports, fixes, etc.)
   - Use `<leader>f` to format the current file

4. **Terminal:**
   Press `<leader>tt` to open a terminal in a split window

5. **Efficient editing:**
   - Use `J` and `U` to add blank lines without entering insert mode
   - Use `d` to delete without affecting your yank buffer
   - Select text in visual mode and use `J`/`K` to move lines up/down

6. **Quick file operations:**
   - `<leader>w` to save
   - `<leader>q` to close current buffer
   - `<leader>nf` to create a new empty file

7. **Competitive programming:**
   - Open a new C++ file
   - Press `<leader>cf` to insert the Codeforces template

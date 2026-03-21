# My Neovim Config

It all began because I thought it looked cool, but then I started to realize that Vim motions — and the understanding that Vim/Neovim gave me — were actually really helpful.
In the beginning, I used LazyVim and later tried LunarVim for a while, but there were too many features I didn't even understand, so I decided to create my own configuration.

## Features

- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and efficient plugin loading
- **LSP Support**: Full Language Server Protocol integration with Mason, capabilities wired to nvim-cmp
- **Autocompletion**: nvim-cmp with LSP, buffer, and path sources
- **Fuzzy Finding**: Telescope for quick file navigation and searching
- **LaTeX Support**: Comprehensive LaTeX editing with VimTeX, Zathura viewer, and custom templates
- **Syntax Highlighting**: Tree-sitter for accurate and fast syntax highlighting
- **Terminal Integration**: ToggleTerm with C-\ toggle and line/selection sending
- **Snippets**: UltiSnips with custom LaTeX snippets
- **Auto-pairing**: nvim-autopairs for brackets and quotes

## Installation

1. **Backup your existing Neovim configuration (if any):**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository:**
   ```bash
   git clone https://github.com/AlfredoQuintella/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install all plugins on first launch.

4. **LSP servers are installed automatically** via Mason on first launch. You can also manage them manually:
   ```vim
   :Mason
   ```

## Structure

```
~/.config/nvim/
├── init.lua                      # Entry point: loads options, plugins, keymaps, latex templates
├── lazy-lock.json                # Plugin version lock file (commit this)
├── lua/
│   ├── config/
│   │   ├── options.lua           # Editor options (numbers, indent, clipboard, etc.)
│   │   ├── keymaps.lua           # All custom keybindings
│   │   └── latex_templates.lua   # Auto-prompt template on new .tex file
│   ├── lazy_setup.lua            # Bootstraps and configures lazy.nvim
│   └── plugins/
│       ├── masonlsp.lua          # Mason + LSP servers + diagnostics config
│       ├── cmp.lua               # nvim-cmp autocompletion
│       ├── telescope.lua         # Fuzzy finder
│       ├── treesitter.lua        # Syntax highlighting
│       ├── vimtex.lua            # LaTeX support
│       ├── autopairs.lua         # Auto-close brackets
│       ├── toggleterm.lua        # Terminal integration + C++ runner
│       ├── tokyonight.lua        # Color scheme
│       └── ultisnips.lua         # Snippet engine
├── latex-templates/
│   ├── main-article.tex          # Full article template (KOMA-script)
│   ├── chapter-article.tex       # Chapter skeleton
│   └── free_writing.tex          # Blank template
└── UltiSnips/
    └── tex.snippets              # Custom LaTeX snippets
```

## Key Mappings

**Leader key**: `Space`

All keymaps listed here are active in normal mode unless noted otherwise.
LSP keymaps are buffer-local — they only activate when a language server is attached.

---

### Navigation

| Key | Action |
|-----|--------|
| `<C-d>` | Scroll half page down (cursor stays centered) |
| `<C-u>` | Scroll half page up (cursor stays centered) |
| `n` | Next search result (cursor stays centered) |
| `N` | Previous search result (cursor stays centered) |

---

### Files & Buffers

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files (Telescope) |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep across project |
| `<leader>fb` | Browse open buffers |
| `<leader>fh` | Search help tags |
| `<leader>n` | Open/create file by name (`:edit` prompt) |
| `<leader>w` | Save file |
| `<leader>q` | Close current buffer (confirms if unsaved) |
| `<leader>Q` | Quit all (confirms if unsaved) |

---

### Editing

| Key | Mode | Action |
|-----|------|--------|
| `J` | Normal | Insert empty line below without entering insert mode |
| `U` | Normal | Insert empty line above without entering insert mode |
| `d` / `D` / `dd` | Normal | Delete to void register (preserves yank buffer) |
| `d` | Visual | Delete to void register (preserves yank buffer) |
| `<` | Visual | Indent left (stays in visual mode) |
| `>` | Visual | Indent right (stays in visual mode) |
| `J` | Visual | Move selected lines down |
| `K` | Visual | Move selected lines up |
| `<leader>rw` | Normal | Replace word under cursor globally (interactive) |
| `<leader>ss` | Visual | Search for visually selected text |
| `<Esc>` | Normal | Clear search highlighting |

---

### Terminal

| Key | Mode | Action |
|-----|------|--------|
| `<C-\>` | Normal / Terminal | Toggle terminal (float) |
| `<leader>t` | Normal | Send current line to terminal |
| `<leader>t` | Visual | Send selected lines to terminal |
| `<F5>` | Normal | Compile and run current C++ file (float terminal) |

---

### LSP (active when a language server is attached)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show all references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format document |
| `<leader>d` | Show diagnostics float for current line |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |

---

### Autocompletion (nvim-cmp, active in insert mode)

| Key | Action |
|-----|--------|
| `<C-n>` | Select next suggestion |
| `<C-p>` | Select previous suggestion |
| `<C-y>` | Confirm selected suggestion |
| `<C-Space>` | Manually trigger completion popup |
| `<C-d>` | Scroll down in suggestion documentation |
| `<C-u>` | Scroll up in suggestion documentation |

---

### LaTeX (active only in `.tex` files)

| Key | Action |
|-----|--------|
| `<leader>tc` | Start/stop continuous compilation (VimTeX) |
| `<leader>tv` | Compile and open PDF in Zathura |
| `<leader>tC` | Clean auxiliary files |
| `<localleader>ll` | VimTeX: compile |
| `<localleader>lv` | VimTeX: view PDF |
| `<localleader>le` | VimTeX: show errors |
| `<localleader>lc` | VimTeX: clean |

#### UltiSnips (insert mode, LaTeX files)

| Trigger | Snippet |
|---------|---------|
| `mk` | Inline math `\( ... \)` (auto) |
| `dm` | Display math `\[ ... \]` (auto) |
| `fr` | Fraction `\frac{num}{den}` |
| `seq` | Sequence `\{a_n\}_{n \in \mathbb{N}}` |
| `it` | Itemize environment |
| `<Tab>` | Expand snippet |
| `<C-j>` | Jump to next snippet placeholder |
| `<C-k>` | Jump to previous snippet placeholder |

---

### Competitive Programming

| Key | Action |
|-----|--------|
| `<leader>cf` | Insert Codeforces C++ template with current timestamp |
| `<F5>` | Compile with `g++` and run in float terminal |

---

## Language Support

LSP servers are installed and managed automatically via Mason:

| Language | Server | Notes |
|----------|--------|-------|
| Python | `pyright` | Type checking disabled (off) |
| C / C++ | `clangd` | Background indexing enabled |
| LaTeX | `texlab` | Works alongside VimTeX |
| Julia | `julials` | Requires Julia installed |
| R | `r_language_server` | Requires `languageserver` R package |

## LaTeX Workflow

When you create a new `.tex` file, a template picker appears automatically. Templates live in `latex-templates/` and can be customized freely.

Available templates:
- `main-article` — Full KOMA-script article with math packages, biblatex, and theorem environments
- `chapter-article` — Minimal chapter/section skeleton
- `free_writing` — Blank file

Compilation is handled by VimTeX with Zathura as the PDF viewer. Use `<leader>tc` to toggle continuous compilation — it recompiles on every save automatically.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [vimtex](https://github.com/lervag/vimtex) | LaTeX editing |
| [UltiSnips](https://github.com/SirVer/ultisnips) | Snippet engine |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal integration |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Color scheme |

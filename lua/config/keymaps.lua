-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Open file search
keymap('n', '<leader><leader>', require('telescope.builtin').find_files, opts)

-- Controlling lines in visual mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Replace current word globally
keymap("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add empty line below/above without insert mode
keymap("n", "J", "o<Esc>k")
keymap("n", "U", "O<Esc>j")

-- Use void register to preserve yank buffer when deleting
keymap({ "n", "v" }, "d", '"_d')
keymap("n", "D", '"_D')
keymap("n", "dd", '"_dd')

-- Change delete from visual mode
keymap('v', 'd', '"_d', { noremap = true, silent = true })

-- Clear search highlighting
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Search for visually selected text
keymap("v", "<leader>ss", [["zy/\V<C-R>z<CR>]], { noremap = true, silent = true })

-- Fast quit/save
keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
keymap('n', '<leader>q', ':confirm q<CR>', { noremap = true, silent = true })

-- Ask to save if only :q
keymap('n', ':q', ':confirm q<CR>', { noremap = true, silent = true })

-- Fast terminal open
keymap('n', '<leader>tt', ':split | terminal<CR>')

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

-- Fast quit/save
keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
keymap('n', '<leader>q', ':confirm q<CR>', { noremap = true, silent = true })

-- Ask to save if only :q
keymap('n', ':q', ':confirm q<CR>', { noremap = true, silent = true })

-- Change delete from visual mode
keymap('v', 'd', '"_d', { noremap = true, silent = true })

-- Fast terminal open
keymap('n', '<leader>tt', ':split | terminal<CR>')

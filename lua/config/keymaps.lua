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
keymap({ "n", "v" }, "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "dd", '"_dd', opts)

-- Clear search highlighting
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Search for visually selected text
keymap("v", "<leader>ss", [["zy/\V<C-R>z<CR>]], opts)

-- Fast quit/save
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':confirm bd<CR>', opts)
keymap("n", "<leader>Q", ":confirm qa<CR>", opts)

-- New file with name prompt (removed <leader>nf to avoid timeout conflict)
keymap("n", "<leader>n", ":edit ", { noremap = true })

-- Send lines to terminal (toggleterm)
keymap('n', '<leader>t', ':ToggleTermSendCurrentLine<CR>', { desc = "enviar linha ao terminal", silent = true })
keymap('v', '<leader>t', ':ToggleTermSendVisualLines<CR>', { desc = "enviar seleção ao terminal", silent = true })

-- Codeforces template command and keymap
vim.api.nvim_create_user_command('Codeforces', function()
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local template = string.format([[/**
*    author: AlfredoQuintella
*    created: %s
**/
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);
    return 0;    
}
]], date)
    vim.api.nvim_put(vim.split(template, "\n"), "c", true, true)
end, {})

keymap("n", "<leader>cf", ":Codeforces<CR>", { desc = "insert codeforces template" })


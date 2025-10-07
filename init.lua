-- ~/.config/nvim/init.lua

require("config.options")
require("lazy_setup")
require("config.keymaps")
require("startup").setup()

-- Adding templates for latex
local template_dir = vim.fn.expand("~/.config/nvim/latex-templates")
local function load_latex_template()
    if vim.fn.line("$") > 1 or vim.fn.getline(1) ~= "" then return end
    local templates = vim.fn.glob(template_dir .. "/*.tex", false, true)

    if #templates == 0 then return end

    local display = {}
    for _, path in ipairs(templates) do
        table.insert(display, vim.fn.fnamemodify(path, ":t:r"))
    end

    vim.ui.select(display, { prompt = "Select LaTeX template: " }, function(choice)
        if not choice then return end
        local selected = template_dir .. "/" .. choice .. ".tex"
        local lines = vim.fn.readfile(selected)
        print("\n") 
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
   end)
end

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.tex",
    callback = function()
        vim.defer_fn(load_latex_template, 10)
    end,
})

-- Creating codeforces command  
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

-- Mappping <leader>cf to codeforces command
vim.keymap.set("n", "<leader>cf", ":Codeforces<CR>", { desc = "insert codeforces template" })


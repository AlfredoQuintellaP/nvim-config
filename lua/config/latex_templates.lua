-- ~/.config/nvim/lua/config/latex_templates.lua

local M = {}

M.template_dir = vim.fn.stdpath("config") .. "/latex-templates"

local function load_latex_template()
    -- Only load if buffer is empty
    if vim.fn.line("$") > 1 or vim.fn.getline(1) ~= "" then
        return
    end

    local templates = vim.fn.glob(M.template_dir .. "/*.tex", false, true)
    if #templates == 0 then
        return
    end

    local display = {}
    for _, path in ipairs(templates) do
        table.insert(display, vim.fn.fnamemodify(path, ":t:r"))
    end

    vim.ui.select(display, { prompt = "Select LaTeX template: " }, function(choice)
        if not choice then return end

        local selected = M.template_dir .. "/" .. choice .. ".tex"
        local lines = vim.fn.readfile(selected)
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end)
end

function M.setup()
    vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "*.tex",
        callback = function()
            vim.defer_fn(load_latex_template, 50)
        end,
    })
end

return M

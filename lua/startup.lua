-- ~/.config/nvim/lua/startup.lua

local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 then
        vim.cmd("enew")

        local header = {
          "██╗██╗  ██╗ █████╗ ██████╗  ██████╗ ███████╗",
          "██║██║ ██╔╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝",
          "██║█████╔╝ ███████║██████╔╝██║   ██║███████╗",
          "██║██╔═██╗ ██╔══██║██╔══██╗██║   ██║╚════██║",
          "██║██║  ██╗██║  ██║██║  ██║╚██████╔╝███████║",
          "╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝",
          "              Íkaros / Ἴκαρος               ",
          "                                            ",
        }

        local footer = {
          "",
          "[n] Novo Arquivo",
          "[f] Encontrar Arquivo",
          "[r] Recentes",
          "[q] Sair",
        }

        local function center_line(line)
          local width = vim.api.nvim_get_option("columns")
          local padding = math.floor((width - vim.fn.strdisplaywidth(line)) / 2)
          return string.rep(" ", math.max(padding, 0)) .. line
        end

        local lines = {}
        local total_height = #header + #footer
        local vertical_padding = math.floor((vim.o.lines - total_height) / 2)

        for _ = 1, vertical_padding do
          table.insert(lines, "")
        end
        for _, l in ipairs(header) do
          table.insert(lines, center_line(l))
        end
        for _, l in ipairs(footer) do
          table.insert(lines, center_line(l))
        end

        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
        vim.cmd("setlocal buftype=nofile")
        vim.cmd("setlocal bufhidden=wipe")
        vim.cmd("setlocal nobuflisted")
        vim.cmd("setlocal nonumber norelativenumber nocursorline")
        vim.bo.filetype = "startup"
        vim.keymap.set("n", "n", ":enew<CR>", { buffer = true, silent = true })
        vim.keymap.set("n", "f", ":Telescope find_files<CR>", { buffer = true, silent = true })
        vim.keymap.set("n", "r", ":Telescope oldfiles<CR>", { buffer = true, silent = true })
        vim.keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
      end
    end,
  })
end

return M


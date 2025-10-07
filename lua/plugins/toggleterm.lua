-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Terminal (float)" },
    { "<F5>", desc = "Compilar e rodar C++ no terminal" }, -- descrição para o Lazy
  },
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "tab",  -- pode ser 'horizontal', 'vertical', 'tab' ou 'float'
      close_on_exit = true,
      shell = vim.o.shell,
    })

    -- Mapeia <F5> para compilar e executar o arquivo C++
    vim.keymap.set("n", "<F5>", function()
      local filename = vim.fn.expand("%")
      local output = vim.fn.expand("%:r")
      local cmd = "g++ " .. filename .. " -o " .. output .. " && ./" .. output
      require("toggleterm").exec(cmd, 1, 12, "float")
    end, { desc = "Compilar e rodar C++ no terminal flutuante" })
  end,
}


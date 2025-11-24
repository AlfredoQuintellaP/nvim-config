-- ~/.config/nvim/lua/plugins/vimtex.lua

return {
  {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.opt.conceallevel = 1
      vim.g.tex_conceal = "abdmg"
      
      -- Manter mapeamentos padrão do vimtex (usam <localleader>)
      vim.g.vimtex_mappings_enabled = 1
      
      -- Adicionar SEUS mapeamentos personalizados
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          local opts = { buffer = true, noremap = true }
          
          -- Seus mapeamentos personalizados
          vim.keymap.set("n", "<leader>tc", "<cmd>VimtexCompile<cr>", opts)
          vim.keymap.set("n", "<leader>tv", "<cmd>VimtexCompile<cr><cmd>VimtexView<cr>", opts)
          vim.keymap.set("n", "<leader>tC", "<cmd>VimtexClean<cr>", opts)
        end
      })
    end,
  },
}

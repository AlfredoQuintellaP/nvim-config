-- ~/.config/nvim/lua/plugins/ultisnips.lua

return {
  "SirVer/ultisnips",
  dependencies = { "honza/vim-snippets" }, -- snippets prontos (LaTeX incluso)
  event = "InsertEnter",
  init = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
    vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "vim-snippets" }
  end,
}


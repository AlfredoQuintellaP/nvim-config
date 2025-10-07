-- ~/.config/nvim/lua/plugins/masonlsp.lua

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "clangd",
        "gopls",
        "rust_analyzer",
        "volar",
        "texlab",
      },
    })

    local lspconfig = require("lspconfig")

    local servers = {
      pyright = {},
      clangd = {},
      gopls = {},
      rust_analyzer = {},
      volar = {},
      texlab = {},
    }

    for server, config in pairs(servers) do
      lspconfig[server].setup(config)
    end
  end,
}


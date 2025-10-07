-- ~/.config/nvim/lua/config/options.lua

-- Defining the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enabling number/realtive number
vim.opt.number = true
vim.opt.relativenumber = true

-- Changing indentantion to space
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Activing/ddesactiving mouse
vim.opt.mouse = "a"

-- Clipboard nvim to outside
vim.opt.clipboard = "unnamedplus"

-- Enablind line wraper
--vim.opt.wrap = true
--vim.opt.linebreak = true

-- Enabling vertical line, treating initial page case
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if args.match ~= "startup" then
      vim.opt_local.colorcolumn = "90"
    end
  end,
})

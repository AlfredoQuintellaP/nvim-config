-- ~/.config/nvim/init.lua

require("config.options")
require("lazy_setup")
require("config.keymaps")

require("config.latex_templates").setup()

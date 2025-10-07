-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
  config = function()
    require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "venv/",
                    "%.pyc",
                    "__pycache__"
                },
            },
        })
  end,
}

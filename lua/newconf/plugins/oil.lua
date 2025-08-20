return {
  "stevearc/oil.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local oil = require("oil")
    local oil_configs = require("newconf.config.oil")
    oil.setup(oil_configs)
    local map = vim.keymap.set
    local opts = { silent = true }
    map("n", "-", "<cmd>Oil --float<CR>", opts)
  end,
}

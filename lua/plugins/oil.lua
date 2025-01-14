return {
  "stevearc/oil.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local oil = require("oil")
    local oil_configs = require("config.oil")
 
    oil.setup(oil_configs)
    require("mapping.oil")
  end,
}

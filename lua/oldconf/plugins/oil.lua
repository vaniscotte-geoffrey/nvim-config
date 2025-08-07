return {
  "stevearc/oil.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local oil = require("oil")
    local oil_configs = require("oldconf.config.oil")
 
    oil.setup(oil_configs)
    require("oldconf.mapping.oil")
  end,
}

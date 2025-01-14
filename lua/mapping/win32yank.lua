local map = vim.keymap.set
-- local opts = require("mappings.default_mappings_opts")

map({ "v" }, "<C-c>", '"+y')
map({ "v" }, "<C-x>", '"+x')
map({ "v" }, "<C-v>", '"+p')

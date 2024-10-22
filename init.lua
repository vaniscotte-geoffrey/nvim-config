require("config.lazy")
require("mapping.window")
require("config.alpha")
require("mapping.diagnostic")

vim.keymap.set({"n", "i", "v"}, "<c-s>", "<cmd>w<cr>")

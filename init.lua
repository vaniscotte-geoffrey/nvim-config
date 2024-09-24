require("config.lazy")
require("mapping.window")
require("config.alpha")

vim.keymap.set({"n", "i", "v"}, "<c-s>", "<cmd>w<cr>")

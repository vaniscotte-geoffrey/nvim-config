require("config.lazy")
require("mapping.window")

vim.keymap.set({"n", "i", "v"}, "<c-s>", "<cmd>w<cr>")

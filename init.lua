require("config.lazy")
require("mapping.window")
require("config.alpha")
require("mapping.diagnostic")
require("config.win32yank")
require("mapping.win32yank")
require("config.auto-remove-import");

vim.keymap.set({"n", "i", "v"}, "<c-s>", "<cmd>w<cr>")

require("oldconf.config.lazy")
require("oldconf.mapping.window")
require("oldconf.config.alpha")
require("oldconf.mapping.diagnostic")
require("oldconf.config.win32yank")
require("oldconf.mapping.win32yank")
require("oldconf.config.auto-remove-import");
require("oldconf.mapping.oil")

vim.keymap.set({"n", "i", "v"}, "<c-s>", "<cmd>w<cr>")

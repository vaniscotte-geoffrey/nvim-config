local map = vim.keymap.set
local opts = { silent = true }
map("n", "-", "<cmd>Oil --float<CR>", opts)

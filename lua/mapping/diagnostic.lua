local hasfloatingwin = require("utils.has-floating-window")
 
local augrp = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
 
augrp("ShowDiagnostics", {clear = true})
autocmd("CursorHold", {
	group =  "ShowDiagnostics",
	pattern = {"*"},
	callback = function()
		if vim.diagnostic.is_enabled() then
			if not hasfloatingwin() then
				vim.diagnostic.open_float()
			end
		end
	end
})

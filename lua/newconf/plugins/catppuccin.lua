return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function ()
		require("catppuccin").setup({
			flavour = "auto",
			background = {
				light = "macchiato",
				dark = "mocha"
			}
		})
		vim.cmd.colorscheme("catppuccin")
	end
}

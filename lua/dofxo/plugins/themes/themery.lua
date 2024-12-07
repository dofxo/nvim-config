return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				"rose-pine-main",
				"rose-pine-moon",
				"catppuccin-mocha",
				"catppuccin-latte",
				"gruvbox",
				"PaperColor",
			},
		})
	end,
}

return {
	"eldritch-theme/eldritch.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd([[colorscheme eldritch]])

		require("eldritch").setup({
			transparent = true,
			terminal_colors = true,
			lualine_bold = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
			},
		})
	end,
}

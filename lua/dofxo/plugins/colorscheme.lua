return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first,
	config = function()
		vim.cmd("colorscheme Onelight_vivid") -- (onedark, onelight, onedark_vivid, onedark_dark)
	end,
}

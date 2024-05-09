return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		-- to add a surrounding => ys + motion + character
		-- to remove a surroinding => ds + character
		require("nvim-surround").setup({})
	end,
}

return {
	"fulcain/collect.nvim",
	config = function()
		local collect = require("collect")
		collect.setup({})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}

return {
	"navarasu/onedark.nvim",
	config = function()
		-- Lua
		require("onedark").setup({
			style = "deep",
		})

		require("onedark").load()
	end,
}

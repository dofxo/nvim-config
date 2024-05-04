return {
	"f-person/git-blame.nvim",
	config = function()
		local gitBlame = require("gitblame")

		gitBlame.setup({
			enabled = true,
			message_when_not_committed = "Not commited yet, do it please.",
		})
	end,
}

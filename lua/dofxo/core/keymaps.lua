-- setting leader key to space
vim.g.mapleader = " "

-- enable mousemoveevent
vim.o.mousemoveevent = true

local keymap = vim.keymap

-- General Keymaps -------------------
keymap.set("n", "<leader><leader>", function()
	vim.cmd("w!")
end, { desc = "Force save file like :w!" })

-- clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlights" })

-- redo action
keymap.set("n", "<leader>r", vim.cmd.redo, { desc = "Redo action" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decr ment number" }) -- decrement

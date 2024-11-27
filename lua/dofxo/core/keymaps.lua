-- setting leader key to space
vim.g.mapleader = " "

-- enable mousemoveevent
vim.o.mousemoveevent = true

local keymap = vim.keymap

-- General Keymaps -------------------
keymap.set("n", "<leader><leader>", function()
	-- Save the file
	vim.cmd("w!")
end, { desc = "Save Changes" })

-- clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlights" })

-- redo action
keymap.set("n", "<leader>r", vim.cmd.redo, { desc = "Redo action" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decr ment number" }) -- decrement

-- Prettier format keymap -------------------
keymap.set("n", "<leader>p", function()
	-- Format the current file using Prettier
	vim.lsp.buf.format({ async = true })
end, { desc = "Format file with Prettier" })

vim.keymap.set("n", "<leader>ct", ":Themery <CR>")

-- Define a function to toggle between light and dark background
local is_dark = true

local function toggle_background()
	vim.o.background = is_dark and "light" or "dark"
	is_dark = not is_dark
end

-- Add a keybinding to toggle background (e.g., <leader>cb)
vim.keymap.set("n", "<leader>cb", toggle_background, { desc = "Toggle Background Color" })

-- setting leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

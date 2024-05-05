-- setting leader key to space
vim.g.mapleader = " "

-- enable mousemoveevent
vim.o.mousemoveevent = true

local keymap = vim.keymap

-- General Keymaps -------------------
keymap.set("n", "<leader><leader>", vim.cmd.w, { desc = "works as :w to save file" })

-- clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

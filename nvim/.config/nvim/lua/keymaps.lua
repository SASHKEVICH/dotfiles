vim.keymap.set("n", "<C-q>", ":wqa!<CR>", { desc = "Quit" })
vim.keymap.set("t", "T<Esc>", "<C-\\><C-n>", { desc = "Go to normal mode in terminal" })
vim.keymap.set("n", ",,", ":nohl<cr>", { desc = "Remove search hightligthing" })

vim.keymap.set("c", "qt", "tabclose<CR>")

vim.keymap.set("", ";", ":")
vim.keymap.set("", ":", ";")
vim.keymap.set("n", "m", "^")

vim.keymap.set("n", "<leader>;", ":source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<C-j>", "i<CR><ESC>")
vim.keymap.set("n", "<C-l>", "gt")
vim.keymap.set("n", "<C-h>", "gT")
vim.keymap.set("n", "<C-n><C-n>", ":set number!<CR>")
vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>")

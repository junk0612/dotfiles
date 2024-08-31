local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.o.autoread = true
vim.o.mouse = ''
vim.o.number = true
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.swapfile = false
vim.o.shiftwidth = 2
vim.o.scrolloff = 10
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.winblend = 30

vim.keymap.set("c", "qt", "tabclose")

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("n", "m", "^")

vim.keymap.set("n", "<Space>;", ":source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<Space>t", ":tabnew<CR>")
vim.keymap.set("n", "<C-j>", "i<CR><ESC>")
vim.keymap.set("n", "<C-l>", "gt")
vim.keymap.set("n", "<C-h>", "gT")
vim.keymap.set("n", "<C-n><C-n>", ":set number!<CR>")
vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>")

vim.keymap.set("n", "<Space>L", ":Lazy<CR>")

vim.api.nvim_set_hl(0, "Normal", { bg='None' })
vim.api.nvim_set_hl(0, "NormalFloat", { bg='DarkCyan' })

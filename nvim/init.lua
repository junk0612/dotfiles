local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.keymap.set("n", "<Space>L", ":Lazy<CR>")

require("config/option")
require("config/keymap")

vim.api.nvim_set_hl(0, "Normal", { bg='None' })
vim.api.nvim_set_hl(0, "NormalFloat", { bg='DarkCyan' })
vim.api.nvim_set_hl(0, "LineNr", { fg='White' })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg='Yellow' })

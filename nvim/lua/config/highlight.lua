vim.cmd.highlight("clear")

vim.api.nvim_set_hl(0, "Normal", { bg='None' })
vim.api.nvim_set_hl(0, "CursorLine", { bg='None' })
vim.api.nvim_set_hl(0, "LineNr", { fg='White' })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg='Yellow', bold = true })

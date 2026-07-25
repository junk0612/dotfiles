return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- main ブランチは lazy-loading 非対応
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- markdown / lua / vim / vimdoc / c / query は Neovim 同梱なので入れない
      require("nvim-treesitter").install({ "ruby", "typescript", "rbs" })

      -- main ではハイライトと indent の有効化は利用側の責務
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "ruby", "typescript", "rbs", "markdown", "lua" },
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  }
}

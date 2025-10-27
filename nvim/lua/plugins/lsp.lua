return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason setup (LSPサーバーの自動インストール管理)  
    require("mason").setup()

    -- Ruby LSP
    vim.lsp.config("ruby_lsp", {})
    vim.lsp.enable("ruby_lsp")

    -- TypeScript/JavaScript LSP
    vim.lsp.config("ts_ls", {
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    })
    vim.lsp.enable("ts_ls")

    -- mason-lspconfig setup
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ruby_lsp",    -- Ruby
        "ts_ls",       -- TypeScript/JavaScript
      },
      automatic_enable = false,
    })

    -- 診断表示の設定
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = false,
      update_in_insert = false,
      severity_sort = true,
    })
  end
}

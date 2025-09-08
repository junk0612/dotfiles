return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason setup (LSPサーバーの自動インストール管理)  
    require("mason").setup()
    
    -- LSPサーバーの設定
    local lspconfig = require("lspconfig")
    
    -- Ruby LSP
    lspconfig.ruby_lsp.setup({})
    
    -- TypeScript/JavaScript LSP
    lspconfig.ts_ls.setup({
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    })
    
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
return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function()
    require("telescope").setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }
    }
    -- fzf-nativeで高速化
    require("telescope").load_extension("fzf")
    
    -- キーマップ設定
    local builtin = require("telescope.builtin")
    
    -- ファイル検索
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    
    -- ヘルプ検索
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
    
    -- LSP定義ジャンプ
    vim.keymap.set("n", "<leader>jd", builtin.lsp_definitions, { desc = "Jump to definitions" })
    vim.keymap.set("n", "<leader>ji", builtin.lsp_implementations, { desc = "Jump to implementations" })
  end
}
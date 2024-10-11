return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
	filtered_items = {
	  visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
	},
      },
    }
    vim.keymap.set("n", "<Space>ff", ":Neotree toggle=true<CR>")
  end
}

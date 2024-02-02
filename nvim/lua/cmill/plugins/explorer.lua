return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "e", "<cmd>Neotree position=current<cr>", silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
      hijack_netrw_behavior = "open_current",
    },
    window = {
      mappings = {
        ["w"] = "",
      },
    },
  },
}

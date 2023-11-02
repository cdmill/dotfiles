return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      shade_terminals = false,
      insert_mappings = true,
      terminal_mappings = true,
      direction = "float",
      auto_scroll = true,
      persist_size = false,
      hide_numbers = true,
      highlights = {
        FloatBorder = {
          guifg = "#9da9a0",
        },
      },
      float_opts = {
        border = "rounded",
      },
    },
    event = { "BufEnter" },
  },
}

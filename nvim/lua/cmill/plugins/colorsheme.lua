return {
  {
    "sainnhe/everforest",
    priority = 1000,
    -- stylua: ignore
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_performance = 1
      vim.g.everforest_ui_contrast = "low"
      vim.g.everforest_float_style = "dim"
      vim.g.everforest_cursor = "orange"
      vim.cmd("colorscheme everforest")
    end,
  },
}

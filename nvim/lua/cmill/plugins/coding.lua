return {
  {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "tpope/vim-surround",
    event = { "BufRead", "BufNewFile" },
  },
  -- stylua: ignore
  {
    "folke/todo-comments.nvim",
    event = { "BufRead", "BufNewFile" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xx", "<cmd>TodoTelescope<cr>", desc = "Todo (Trouble)" },
    },
    opts = {
      keywords = {
        FIX = { icon = " ", color = "#ea6962", alt = { "BUG", "ISSUE" } },
        TODO = { icon = "󰦐 ", color = "#7daea3" },
        HACK = { icon = "󰈻 ", color = "#e78a4e" },
        WARN = { icon = "󰹆 ", color = "#d8a657", alt = { "WARNING" } },
        PERF = { icon = " ", color = "#d8a657", alt = { "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "󰎞 ", color = "#89b472", alt = { "INFO" } },
        TEST = { icon = "󱖫 ", color = "#d3869b", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },
}

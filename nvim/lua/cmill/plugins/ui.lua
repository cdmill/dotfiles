return {
  { "MunifTanjim/nui.nvim", event = "VeryLazy" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local components = require("cmill.core.util").statusline_components()
      local setup = {
        options = {
          icons_enabled = true,
          theme = "neomodern",
          section_separators = { left = "", right = "" },
          -- section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = { "starter" },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = {
            components.modes,
          },
          lualine_b = {
            components.branch,
            components.diff,
          },
          lualine_c = {
            components.nvim_icon,
            components.diagnostics,
            components.filename,
          },
          lualine_x = {
            components.tabs,
            components.location,
          },
          lualine_y = {
            components.progress,
          },
          lualine_z = {},
        },
        extensions = {
          "man",
        },
      }
      return setup
    end,
  },
}

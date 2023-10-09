return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          section_separators = { left = "", right = " " },
          component_separators = { left = "", right = "" },
          disabled_filetypes = { "neo-tree" },
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
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filename", path = 3 },
            { "branch", icon = "" },
            { "diff" },
          },
          lualine_x = {
            {
              "filetype",
              colored = false,
              icon_only = true,
            },
            "location",
            "progress",
            "filesize",
            "encoding",
          },
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}

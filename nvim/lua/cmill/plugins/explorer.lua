return {
  {
    "cdmill/oil.nvim",
    event = "VimEnter",
    keys = {
      { "<leader>fe", "<cmd>Oil<cr>" },
      { "<leader>fE", "<cmd>Oil " .. vim.fn.getcwd() .. "<cr>" },
    },
    cmd = "Oil",
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      columns = {},
      float = {
        padding = 2,
        max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.45),
        max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.6),
      },
      auto_close_last_buffer = true,
      keymaps = {
        ["q"] = "actions.close",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    -- stylua: ignore start
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Toggle Telescope", silent = true, },
      { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Toggle Telescope current buffer", silent = true, },
      { "<leader>fl", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Toggle Telescope lsp symbols", silent = true, },
      { "<leader>fr", "<cmd>Telescope oldfiles cwd_only=true<cr>", desc = "Toggle Telescope recent files", silent = true, },
      { "<leader>fR", "<cmd>Telescope resume<cr>", desc = "Toggle Telescope resume", silent = true, },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Toggle Telescope live_grep", silent = true, },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status", silent = true, },
      { "<leader>gc", "<cmd>Telescope git_bcommits<cr>", desc = "Git status", silent = true, },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Toggle Telescope help", silent = true, },
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true<cr>", desc = "Toggle Telescope buffers", silent = true, },
      { "<leader>fs", "<cmd>Telescope registers<cr>", desc = "Registers", silent = true, },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks", silent = true, },
      { "<leader>fc", require("cmill.core.util").config, desc = "Open config files" },
      { "<leader>fC", "<cmd>Telescope colorscheme<cr>", desc = "Open colorschemes" },
    },
    -- stylua: ignore end
    config = function()
      -- stylua: ignore
      require("telescope.pickers.layout_strategies").center_h = function( picker, max_columns, max_lines, layout_config)
        local layout = require("telescope.pickers.layout_strategies").center(picker, max_columns, max_lines, layout_config)
        layout.results.line = layout.results.line + 1
        layout.results.title = ""
        return layout
      end
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "generated",
            "indent.log",
            "__pycache__",
            ".DS_Store",
          },
          prompt_prefix = " ",
          selection_caret = "󰘍 ",
          layout_strategy = "center_h",
          sorting_strategy = "ascending",
          scroll_strategy = "cycle",
          path_display = { "tail" },
          color_devicons = true,
          winblend = 0,
          preview = {
            hide_on_startup = true,
          },
          layout_config = {
            width = function(_, max_columns)
              return math.max(math.floor(0.40 * max_columns), 60)
            end,
            height = 0.60,
            prompt_position = "top",
          },
          mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
              ["<C-w>"] = "delete_buffer",
            },
            i = {
              ["PP"] = require("telescope.actions").close,
              ["<C-w>"] = "delete_buffer",
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            },
          },
        },
        pickers = {
          find_files = {
            disable_devicons = true,
          },
          oldfiles = {
            disable_devicons = true,
          },
          live_grep = {
            disable_devicons = true,
          },
          buffers = {
            disable_devicons = true,
          },
          registers = {
            theme = "dropdown",
          },
        },
      })
    end,
  },
}

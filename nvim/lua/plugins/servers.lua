return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(
          opts.ensure_installed,
          { "c", "cpp", "python", "markdown_inline", "swift" }
        )
      end
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      }
    end,
  },
  { "lervag/vimtex" },
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/self/**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/self/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      dir = "~/self/uni",
      completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
        prepend_note_id = false,
      },
      disable_frontmatter = true,
      templates = {
        subdir = "resources/templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      mappings = {
        -- ["gf"] = ...
      },
      finder = "telescope.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        pyright = {},
        clangd = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyright",
        "black",
        "clangd",
        "clang-format",
        "latexindent",
        "prettier",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        python = { "black" },
        markdown = { "prettier" },
        c = { "clangd-format" },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      update_events = { "TextChanged", "TextChangedI" },
    },
  },
}

return {
  {
    "lervag/vimtex",
    ft = "tex",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/self/notes/**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/self/notes/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      dir = "~/self/notes/main/",
      templates = {
        subdir = ".resources/templates",
        date_format = "%Y-%B",
        time_format = "%H:%M",
        substitutions = {},
      },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<localleader>x"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        ["<localleader>ll"] = {
          action = function()
            vim.cmd("ObsidianOpen")
          end,
          opts = { buffer = true },
        },
        ["<localleader>gh"] = {
          action = function()
            vim.cmd("ObsidianFollowLink hsplit")
          end,
          opts = { buffer = true },
        },
        ["<localleader>gk"] = {
          action = function()
            vim.cmd("ObsidianFollowLink vsplit")
          end,
          opts = { buffer = true },
        },
        ["<localleader>fl"] = {
          action = function()
            vim.cmd("ObsidianBacklinks")
          end,
          opts = { buffer = true },
        },
      },
      finder = "telescope.nvim",
      log_level = vim.log.levels.OFF,
      ui = {
        enable = true,
        hl_groups = {},
      },
      note_id_func = function(tag)
        local prefix = tag or ""
        return prefix .. os.date("%Y%m%d%H%M")
      end,
      disable_frontmatter = function(note)
        return string.find(note, "python")
          or string.find(note, "tasks")
          or string.find(note, "qn")
      end,
      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
    },
  },
}

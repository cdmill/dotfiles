return {
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
        subdir = "resources/templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {},
      },
      mappings = {},
      finder = "telescope.nvim",
      log_level = vim.log.levels.OFF,
      ui = {
        enable = true,
        hl_groups = {
          ObsidianTodo = { bold = true, fg = "#e67e80" },
          ObsidianDone = { bold = true, fg = "#b7c3e3" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianBullet = { bold = true, fg = "#bfce94", bg = "#181818" },
          ObsidianRefText = { underline = true, fg = "#ecae6d" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#8799cf" },
          ObsidianHighlightText = { fg = "#b7c3e3", bg = "#282c38" },
        },
      },
      note_id_func = function(tag)
        local prefix = tag or ""
        return prefix .. os.date("%Y%m%d%H%M")
      end,
      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
    },
  },
  { "lervag/vimtex" },
}

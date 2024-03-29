return {
  {
    "hrsh7th/nvim-cmp",
    event = "LspAttach",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        commit = "1182638",
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
        -- stylua: ignore
        keys = {
          { "<tab>", function() return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end, expr = true, silent = true, mode = "i", },
          { "<tab>", function() require("luasnip").jump(1) end, mode = "s", },
          { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, },
        },
        config = function()
          -- load custom snippets
          require("luasnip.loaders.from_lua").lazy_load({
            paths = "~/.config/nvim/snippets/",
          })
        end,
      },
      { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
      { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        -- stylua: ignore
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert, }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert, }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["W"] = cmp.mapping.abort(),
          ["<tab>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(_, item)
            local icons = require("cmill.core.util").lspicons()
            local icon = icons[item.kind]
            item.kind = string.format("%s %s", icon, item.kind)
            item.menu = ""
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        window = {
          completion = {
            side_padding = 1,
            scrollbar = false,
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },
}

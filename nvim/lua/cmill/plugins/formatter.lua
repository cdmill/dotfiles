return {
  "stevearc/conform.nvim",
  event = { "BufRead", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      sh = { "shfmt" },
      fish = { "fish_indent" },
      c = { "clang-format" },
      go = { "gofmt" },
      tex = { "latexindent" },
      R = { "styler" },
      ["_"] = { "trim_whitespace" },
    },
    format_on_save = {
      lsp_fallback = false,
      timeout_ms = 500,
    },
    format_after_save = {
      lsp_fallback = false,
    },
    log_level = vim.log.levels.ERROR,
    notify_on_error = true,
    formatters = {
      latexindent = {
        prepend_args = { "-c=./generated/", "-m" },
      },
      shfmt = {
        args = { "-i", "2" },
      },
      ruff_format = {
        condition = function(_, ctx)
          return not string.find(ctx.filename, "trident")
        end,
      },
    },
  },
}

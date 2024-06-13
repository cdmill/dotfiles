return {
  "stevearc/conform.nvim",
  event = { "BufRead", "BufNewFile" },
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        sh = { "shfmt" },
        fish = { "fish_indent" },
        c = { "clang-format" },
        tex = { "latexindent" },
        swift = { "swift_format" },
        ["_"] = { "trim_whitespace" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      format_after_save = {
        lsp_fallback = true,
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
      },
    })
  end,
}

return {
  "stevearc/conform.nvim",
  event = { "BufRead", "BufNewFile" },
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        sh = { "shfmt" },
        c = { "clang-format" },
        tex = { "latexindent" },
        ["_"] = { "trim_whitespace" },
        -- HACK: change to marksman ??
        markdown = { "prettier" },
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
      },
    })
  end,
}
local map = vim.keymap.set

local function augroup(name)
  return vim.api.nvim_create_augroup("cmill" .. name, { clear = true })
end

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if
      vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc
    then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.keymap.set("n", "q", "<cmd>bd!<cr>", { buffer = true })
  end,
})

-- lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    local builtins = require("telescope.builtin")

    local toggle_diagnostics = function()
      vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end

    -- lsp
    local opts = { buffer = ev.buf }
    map("n", "gd", builtins.lsp_definitions, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "<leader>rr", vim.lsp.buf.rename, opts)
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>ld", vim.diagnostic.open_float, opts)
    map("n", "<localleader>i", builtins.lsp_implementations, opts)
    map("n", "<localleader>wr", builtins.lsp_references, opts)
    map("n", "<localleader>wd", builtins.diagnostics, opts)
    map("n", "<leader>dd", toggle_diagnostics, opts)

    -- diagnostics
    local diagnostic_goto = function(next, severity)
      local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
      severity = severity and vim.diagnostic.severity[severity] or nil
      return function()
        go({ severity = severity })
      end
    end
    map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
    map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
    map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
    map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
    map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
    map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
  end,
})

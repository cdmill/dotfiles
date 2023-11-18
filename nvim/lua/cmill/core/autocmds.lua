local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't auto-comment when o/O in normal mode
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("no_auto_comment"),
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- remove statuscolumn in neo-tree
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "neo-tree" then
      vim.wo.statuscolumn = ""
    end
  end,
})

-- change some color highlights
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
  group = augroup("Color"),
  callback = function()
    if vim.g.colors_name ~= "gruvbox-material" then
      return
    end

    local dark_bg = "#1d2021"
    local light_bg = "#f2e5bc"
    local border = "#928374"
    local selection_bg = "#282828"
    local orange_hi = "#e78a4e"
    if vim.o.background == "light" then
      vim.cmd(string.format("hi NeoTreeNormal guibg=%s", light_bg))
      vim.cmd(string.format("hi NeoTreeEndOfBuffer guibg=%s", light_bg))
    else
      vim.cmd(string.format("hi NeoTreeNormal guibg=%s", dark_bg))
      vim.cmd(string.format("hi NeoTreeEndOfBuffer guibg=%s", dark_bg))
    end
    vim.cmd(string.format("hi TelescopeSelection guibg=%s", selection_bg))
    vim.cmd(string.format("hi TelescopeBorder guifg=%s", border))
    vim.cmd(string.format("hi CursorLineNr guifg=%s", orange_hi))
  end,
})

local map = vim.keymap.set

-- toggleterm keymaps
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local opts = { buffer = 0 }
    map("t", "<esc>", [[<C-\><C-n>]], opts)
    map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    map("t", "<C-w>", "<esc><cmd>q<cr>")
  end,
})

-- lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- lsp
    local opts = { buffer = ev.buf }
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "cd", "<cmd>Telescope lsp_definitions<CR>", opts)
    map("n", "cD", vim.lsp.buf.declaration, opts)
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>rr", vim.lsp.buf.rename, opts)
    map("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>", opts)
    map("n", "<leader>bd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
    map("n", "<leader>fo", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    -- diagnostics
    local diagnostic_goto = function(next, severity)
      local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
      severity = severity and vim.diagnostic.severity[severity] or nil
      return function()
        go({ severity = severity })
      end
    end
    map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
    map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
    map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
    map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
    map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
    map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
    map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
  end,
})

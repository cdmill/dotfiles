local global_opts = {
  -- LEADER KEYS
  mapleader = " ",
  maplocalleader = "\\",

  -- NETRW
  netrw_banner = 0,
  netrw_browse_split = 0,
  netrw_bufsettings = "noma nomod nu nobl nowrap ro",

  -- MARKDOWN
  autoformat = true,
  markdown_recommended_style = 0,
  markdown_folding = 1,

  -- TEX
  tex_flavor = "latex",
  vimtex_view_method = "skim",
  vimtex_view_skim_sync = 1,
  vimtex_view_skim_activate = 1,
  vimtex_indent_on = 1,
  vimtex_syntax_conceal_disable = 1,
  vimtex_quickfix_open_on_warning = 0,
  vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex" },
  vimtex_compiler_method = "latexmk",
  vimtex_compiler_latexmk = {
    callback = 1,
    continuous = 1,
    executable = "latexmk",
    options = {
      "-shell-escape",
      "-verbose",
      "-file-line-error",
      "-synctex=1",
      "-interaction=nonstopmode",
    },
  },
}

local options = {
  -- TEXT
  fillchars = {
    foldopen = "",
    foldclose = "",
    foldsep = " ",
    fold = " ",
    diff = "╱",
    eob = "~",
  },
  list = true, -- show some invisible characters (tabs...
  scrolloff = 4, -- lines of context
  shiftround = true,
  shiftwidth = 2, -- size of an indent
  spelllang = { "en" },
  tabstop = 2, -- number of spaces tabs count for
  wrap = false,

  -- UX
  autowrite = true,
  clipboard = "unnamedplus", -- sync with system clipboard
  completeopt = "menu,menuone,noselect",
  confirm = true, -- confirm to save changes before exiting modified buffer
  expandtab = true, -- use spaces instead of tabs
  foldcolumn = "auto",
  foldmethod = "indent",
  foldenable = false,
  foldlevel = 99,
  ignorecase = true,
  inccommand = "nosplit", -- preview incremental substitute
  smartcase = true,
  smartindent = true, -- insert indents automatically
  splitbelow = true, -- put new windows below current
  splitkeep = "screen",
  splitright = true, -- put new windows right of current
  timeoutlen = 300,
  undofile = true,
  undolevels = 10000,
  virtualedit = "block", -- allow cursor to move where there is no text in visual block mode
  wildmode = "longest:full,full", -- command-line completion mode

  -- UI
  background = "dark",
  colorcolumn = "",
  conceallevel = 2, -- hide * markup for bold and italic
  cursorline = true,
  cursorlineopt = "number",
  laststatus = 3, -- global statusline
  number = true, -- show current line number
  relativenumber = true, -- relative line numbers
  pumblend = 10, -- popup blend
  pumheight = 10, -- maximum number of entries in a popup
  ruler = false,
  showmode = false,
  showtabline = 0,
  sidescrolloff = 8, -- columns of context
  signcolumn = "yes:1", -- always show the signcolumn, otherwise it would shift the text each time
  statuscolumn = "%!v:lua.require'cmill.core.util'.statuscolumn()",
  termguicolors = true,
  updatetime = 200,
  winminwidth = 5,

  -- MISC
  formatoptions = "jcroqlnt",
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  sessionoptions = {
    "buffers",
    "curdir",
    "tabpages",
    "winsize",
    "help",
    "globals",
    "skiprtp",
    "folds",
  },
}

for k, v in pairs(global_opts) do
  vim.g[k] = v
end

for k, v in pairs(options) do
  vim.opt[k] = v
end

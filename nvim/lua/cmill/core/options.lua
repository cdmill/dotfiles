local globals = {
    mapleader = " ",
    maplocalleader = "\\",

    netrw_banner = 0,
    netrw_browse_split = 0,
    netrw_bufsettings = "noma nomod nu nobl nowrap ro",

    autoformat = true,
    markdown_recommended_style = 0,
    markdown_folding = 1,
}

local opts = {
    autoindent = true,
    autowrite = true,
    background = "dark",
    clipboard = "unnamedplus",
    colorcolumn = "",
    completeopt = "menu,menuone,noselect",
    conceallevel = 2,
    confirm = true,
    cursorline = true,
    cursorlineopt = "number",
    expandtab = true,
    fillchars = {
        stl = " ",
        foldopen = "",
        foldclose = "",
        foldsep = " ",
        fold = " ",
        diff = "╱",
        eob = "~",
    },
    foldcolumn = "1",
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldenable = true,
    foldlevel = 5,
    formatoptions = "jcroqlnt",
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --vimgrep",
    hlsearch = true,
    history = 100,
    ignorecase = true,
    inccommand = "nosplit",
    jumpoptions = "stack,view",
    laststatus = 3,
    list = false,
    mousescroll = "ver:3,hor:0",
    number = true,
    relativenumber = true,
    ruler = false,
    pumblend = 0,
    pumheight = 10,
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
    scrolloff = 10,
    shiftround = true,
    shiftwidth = 4,
    showbreak = "> ",
    showcmd = false,
    showmode = false,
    showtabline = 0,
    sidescrolloff = 8,
    signcolumn = "yes:1",
    smartcase = true,
    smartindent = false,
    spelllang = { "en_us" },
    splitbelow = true,
    splitkeep = "screen",
    splitright = true,
    termguicolors = true,
    tabstop = 4,
    textwidth = 88,
    timeoutlen = 300,
    undofile = true,
    undolevels = 200,
    updatetime = 200,
    virtualedit = "block",
    wildmode = "longest:full,full",
    winborder = "rounded",
    winminwidth = 5,
    wrap = false,
}

for k, v in pairs(globals) do
    vim.g[k] = v
end

for k, v in pairs(opts) do
    vim.opt[k] = v
end

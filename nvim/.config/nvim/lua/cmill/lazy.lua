local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "cmill.plugins" },
    },
    defaults = {
        version = false,
    },
    dev = {
        path = "~/Developer/plugins/",
        patterns = {
            -- "focus.nvim",
            "neomodern",
            -- "sesh",
        },
        fallback = false,
    },
    checker = {
        enabled = false,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    ui = {
        backdrop = 100,
        border = "rounded",
    },
})

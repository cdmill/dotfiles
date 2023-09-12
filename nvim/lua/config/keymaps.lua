-- Keymaps are automatically loaded on the VeryLazy event

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
vim.keymap.set("n", "<leader>mm", ":delm a-zA-Z0-9 | :wviminfo! <cr>", { desc = "Delete all marks", silent = true })

-- Removing LazyGit commands
vim.keymap.set("n", "<leader>gg", "<nop>")
vim.keymap.set("n", "<leader>gG", "<nop>")

vim.cmd.set("tabstop=4")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("expandtab")
vim.cmd.set("number")
vim.cmd.set("relativenumber")
vim.cmd.set("nowrap")

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')

-- Diagnostic
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_prev)

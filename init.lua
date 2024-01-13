vim.cmd.set("tabstop=2")	
vim.cmd.set("shiftwidth=2")	
vim.cmd.set("expandtab")	
vim.cmd.set("number")
vim.cmd.set("relativenumber")

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
  { "rose-pine/neovim", name = "rose-pine" },
  { 
    "nvim-telescope/telescope.nvim", branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "python"},
  highlight = { enabled = true },
  indent = { enabled = true },
})

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("neo-tree").setup()
vim.keymap.set('n', '<leader>e', ':Neotree reveal<CR>')

require("rose-pine").setup()
vim.cmd.colorscheme("rose-pine")

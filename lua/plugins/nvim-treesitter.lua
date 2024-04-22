return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "vrischmann/tree-sitter-templ",
  },
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "python",
        "rust",
        "julia",
        "html",
        "htmldjango",
        "css",
        "go",
        "templ",
      },
      highlight = { enable = true },
      indent = { enable = true },
      sync_install = false,
      auto_install = true,
      ignore_install = { "javascript" },
    })
  end,
}


return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
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
      },
      highlight = { enabled = true },
      indent = { enabled = true },
    })
  end,
}


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
      },
      highlight = { enabled = true },
      indent = { enabled = true },
    })
    vim.treesitter.language.register("html", "jinja2")
  end,
}


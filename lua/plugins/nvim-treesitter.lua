return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "python", "rust", "julia", "templ", "go" },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      modules = {},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

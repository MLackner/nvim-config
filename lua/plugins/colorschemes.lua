return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "main", -- auto, main, moon or dawn
      styles = { bold = true, italic = true, transparency = false },
    },
    priority = 9999,
    config = function(_, opts)
      print(opts.variant)
      require("rose-pine").setup(
        opts
      )
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 9998,
    config = function()
      require("catppuccin").setup()
      vim.cmd.colorscheme("catppuccin")
    end
  },
}

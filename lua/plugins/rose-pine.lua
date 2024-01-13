  return { 
    "rose-pine/neovim", 
    name = "rose-pine",
    opts = {
      variant = "dawn",
      styles = { bold = false },
    },
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end
  }

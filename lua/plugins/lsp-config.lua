return {
	{
		"williamboman/mason.nvim",
		priority = 21, -- load before mason-lspconfig
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		priority = 22, -- load after mason
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ruff", "gopls", "templ", "htmx" },
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim", -- Show function signature
		event = "VeryLazy",
		opts = {
			hint_prefix = "-> ",
      transparency = 30,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		priority = 23, -- load after cmp_nvim_lsp
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff.setup({})
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })
      lspconfig.templ.setup({
        capabilities = capabilities,
      })
      lspconfig.htmx.setup({})

			vim.keymap.set("n", "gd", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set({ "n", "v" }, "<leader>F", function()
				vim.lsp.buf.format({ async = true })
			end, {})
		end,
	},
}

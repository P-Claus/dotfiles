return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "clangd", "docker_compose_language_service"},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({
				cmd = { "clangd" },
				filetypes = { "c", "cpp" },
				capabilities = capabilities,
			})

			lspconfig.docker_compose_language_service.setup({
				cmd = { 'docker-compose-langserver', '--stdio' },
				filetypes = { 'yaml.docker-compose', 'yaml' },
				single_file_support = true,
			})

			lspconfig.dockerls.setup({
				cmd = { 'docker-langserver', '--stdio' },
				filetypes = { 'dockerfile' },
				single_file_support = true,
			})


			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

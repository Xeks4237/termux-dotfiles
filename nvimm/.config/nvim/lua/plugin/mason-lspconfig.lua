-- mason-lspconfig: Auto enables installed with mason, LSP servers
vim.pack.add {
	{
		-- also bridges gaps between mason and nvim-lspconfig
		src = 'https://github.com/mason-org/mason-lspconfig.nvim',
		name = 'mason-lspconfig',
	},
}

-- Configuration for mason-lspconfig
require('mason-lspconfig').setup {
	-- NOTE: "ensure_inatalled = {}" is unneeded,
	-- Because LSP servers are included in mason-tool-installer
	ensure_installed = {}, -- Leave it empty

	-- Auto enable available LSP through vim.lsp.enable(server_name)
	-- NOTE: vim.lsp.enable() requires NeoVim v0.11 or above
	automatic_enable = true,
	-- To exclude certain servers from being automatically enabled:
	-- for example:
	-- automatic_enable = {
	--     exclude = {
	--         "rust_analyzer",
	--         "ts_ls"
	--     },
	-- },
}

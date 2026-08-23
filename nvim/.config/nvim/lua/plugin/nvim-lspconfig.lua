-- nvim-lspconfig: Predefined configurations for LSP servers
vim.pack.add {
	{
		-- NOTE: It auto applies it's predefined configs to builtin vim.lsp.config() for LSP servers
		-- And then you can enable needed servers using vim.lsp.enable(server_name)
		-- In NV-GOD "mason-lspconfig" plugin auto enables installed with mason servers for your NeoVim
		src = 'https://github.com/neovim/nvim-lspconfig',
		name = 'nvim-lspconfig',
	},
}

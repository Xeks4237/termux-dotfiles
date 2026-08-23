-- NOTE: This file contains little pieces of code for "quality of life" features for NV-GOD

-- Highlight pieces of text which was yanked/copied
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
	pattern = '*',
	desc = 'highlight selection on yank',
	callback = function()
		vim.highlight.on_yank { timeout = 200, visual = true }
	end,
})

-- Restore previous position of cursor in files
vim.api.nvim_create_autocmd('BufReadPost', {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd 'normal! zz'
			end)
		end
	end,
})

-- Open :help pages in vertical splits instead of horizontal ones
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'help',
	command = 'wincmd L',
})

-- Auto equally resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd('VimResized', {
	command = 'wincmd =',
})

-- No auto continue comments on new line
-- vim.api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("no_auto_comment", {}),
--     callback = function()
--         vim.opt_local.formatoptions:remove { "c", "r", "o" }
--     end,
-- })

-- IDE like highlight of text segments when stopping cursor on them
vim.api.nvim_create_autocmd('CursorMoved', {
	group = vim.api.nvim_create_augroup('LspReferenceHighlight', { clear = true }),
	desc = 'Highlight references under cursor',
	callback = function()
		-- Only run if the cursor is not in insert mode
		if vim.fn.mode() ~= 'i' then
			local clients = vim.lsp.get_clients { bufnr = 0 }
			local supports_highlight = false
			for _, client in ipairs(clients) do
				if client.server_capabilities.documentHighlightProvider then
					supports_highlight = true
					break -- Found a supporting client, no need to check others
				end
			end

			-- 3. Proceed only if an LSP is active AND supports the feature
			if supports_highlight then
				vim.lsp.buf.clear_references()
				vim.lsp.buf.document_highlight()
			end
		end
	end,
})

-- Clears IDE like text highlight when entering insert mode
vim.api.nvim_create_autocmd('CursorMovedI', {
	group = 'LspReferenceHighlight',
	desc = 'Clear highlights when entering insert mode',
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})

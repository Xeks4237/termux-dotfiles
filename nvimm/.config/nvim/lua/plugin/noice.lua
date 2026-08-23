-- noice: Beautiful UI for messages, cmdline, LSP hover & more
vim.pack.add {
	{
		src = 'https://github.com/folke/noice.nvim',
		name = 'noice',
	},
}

-- Configuration for noice
require('noice').setup {
	debug = false,
	throttle = 1000 / 60, -- 60 FPS updates

	-- Command line
	cmdline = {
		enabled = true,
		view = 'cmdline_popup',

		format = {
			cmdline = { pattern = '^:', icon = '> ', lang = 'vim' },
			search_down = { pattern = '^/', icon = ' ', lang = 'regex' },
			search_up = { pattern = '^%?', icon = ' ', lang = 'regex' },
			filter = { pattern = '^:%s*!', icon = '$ ', lang = 'zsh' },
			lua = {
				pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' },
				icon = ' ',
				lang = 'lua',
			},
			help = { pattern = '^:%s*he?l?p?%s+', icon = '? ' },
			input = { view = 'cmdline', icon = '> ' },
		},
	},

	-- Messages & notifications
	messages = {
		enabled = true,
		view = 'notify',
		view_error = 'notify',
		view_warn = 'notify',
		view_history = 'messages',
		view_search = 'virtualtext',
	},

	popupmenu = {
		enabled = true,
		backend = 'nui',
		kind_icons = true,
	},

	-- LSP integration
	lsp = {
		progress = {
			enabled = true,
			view = 'notify',
			throttle = 1000 / 60,
		},

		override = {
			['vim.lsp.util.convert_input_to_markdown_lines'] = true,
			['vim.lsp.util.stylize_markdown'] = true,
			['cmp.entry.get_documentation'] = true,
		},

		hover = { enabled = true },
		signature = {
			enabled = true,
			auto_open = { enabled = true, trigger = true, luasnip = true, throttle = 50 },
		},
		message = { enabled = true, view = 'notify' },
		documentation = {
			view = 'hover',
			opts = {
				lang = 'markdown',
				replace = true,
				render = 'plain',
				format = { '{message}' },
				win_options = { concealcursor = 'n', conceallevel = 3 },
			},
		},
	},

	-- Smart cursor movement (prevents jumping)
	smart_move = {
		enabled = true,
		excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
	},

	-- View customizations
	views = {
		cmdline_popup = {
			position = { row = '30%', col = '50%' },
			size = { width = '60%', height = 'auto' },
			border = {
				style = 'single',
				padding = { 0, 1 },
				text = { top = ' Command ', top_align = 'center' },
			},
			win_options = {
				winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
				winblend = 0,
			},
		},

		popupmenu = {
			relative = 'editor',
			position = { row = 12, col = '30%' },
			size = { width = 60, height = 10 },
			border = { style = 'single', padding = { 1, 1 } },
			win_options = { winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder' },
		},

		notify = {
			replace = true,
			size = { width = 50, height = 'auto' },
			border = { style = 'single' },
			win_options = { winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder' },
		},

		mini = {
			timeout = 3000,
			position = { row = -2, col = '100%' },
			win_options = { winblend = 30 },
		},

		split = { enter = false, size = '20%' },
		vsplit = { enter = false, size = '20%' },
	},

	-- Message routing
	routes = {
		{ filter = { event = 'msg_show', kind = 'wmsg' }, view = 'mini' }, -- "written" messages
		{ filter = { event = 'msg_show', find = 'search hit' }, opts = { skip = true } },
		{ filter = { event = 'msg_show', min_height = 10 }, view = 'split' }, -- long messages
	},

	-- Presets (highly recommended)
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = true,
		lsp_doc_border = true,
	},

	-- History (:messages)
	history = {
		view = 'split',
		opts = { enter = true, format = 'details', max_height = 15 },
	},

	experimental = {
		lsp_scrollbar = true,
	},
}

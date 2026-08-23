-- nvim-cmp: Tab completions and auto suggestions for nvim
vim.pack.add {
	'https://github.com/hrsh7th/nvim-cmp',
	'https://github.com/hrsh7th/cmp-nvim-lsp',
	'https://github.com/hrsh7th/cmp-buffer',
	'https://github.com/hrsh7th/cmp-path',
	'https://github.com/hrsh7th/cmp-cmdline',
	'https://github.com/petertriho/cmp-git',
}

-- Icons for different completion kinds
local kind_icons = {
	Text = '󰉿',
	Method = '󰆧',
	Function = '󰊕',
	Constructor = '',
	Field = '',
	Variable = '󰆧',
	Class = '󰌗',
	Interface = '',
	Module = '',
	Property = '󰜢',
	Unit = '',
	Value = '󰎠',
	Enum = '',
	Keyword = '󰌋',
	Snippet = '',
	Color = '󰏘',
	File = '󰈙',
	Reference = '',
	Folder = '󰉋',
	EnumMember = '',
	Constant = '󰏿',
	Struct = '',
	Event = '',
	Operator = '󰆕',
	TypeParameter = '󰊄',
}

local cmp = require 'cmp'
require('cmp').setup {
	-- Enable completion
	enabled = true,

	-- Do not preselect any item automatically
	preselect = cmp.PreselectMode.None,

	-- Completion options
	completion = { completeopt = 'menu,menuone,noinsert' },

	-- Appearance of completion and documentation windows
	window = {
		-- Look of completions menu
		completion = cmp.config.window.bordered {
			-- Characters which makes border of completions popup
			-- border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
			border = 'single',
			-- Offset of a popup of a cursor by columns
			col_offset = 1,
			-- Amount of paddings in sides of completions popup
			side_padding = 1,
		},

		-- Look of completions documentation popup
		documentation = cmp.config.window.bordered {
			-- border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
			border = 'single',
			-- Max width of documentation popup
			max_width = 80,
			-- Max hight of documentation popup
			max_height = 40,
		},
	},

	-- View settings
	view = {
		entries = {
			-- Makes names of completions entries to be custom
			name = 'custom',
			-- Order of entries in completions popup, "top_down" or "down_top"
			selection_order = 'top_down',
		},
	},

	-- Snippet engine (Native NeoVim snippets)
	snippet = {
		-- Expand snippets functionality using native NeoVim Snippets
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},

	-- Mappings for popup menus
	mapping = cmp.mapping.preset.insert {
		-- Scrolling documentation popup using Ctrl j or k
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		-- Cancel/Abort selection using Ctrl c
		['<Esc>'] = cmp.mapping.abort(),

		['<CR>'] = cmp.mapping.confirm {
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		},

		-- Tab for selecting next entry on list
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.snippet.jumpable(1) then
				vim.snippet.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),

		-- Shift Tab for selecting previous entry on list
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.snippet.jumpable(-1) then
				vim.snippet.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},

	-- Sources for completion
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', priority = 1000, max_item_count = 25 },
	}, {
		{ name = 'buffer', priority = 500, max_item_count = 15 },
		{ name = 'path', priority = 300, max_item_count = 20 },
	}),

	-- How completions are displayed
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			vim_item.kind = string.format('%s', kind_icons[vim_item.kind] or vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				buffer = '[Buffer]',
				path = '[Path]',
				git = '[Git]',
				cmdline = '[Cmd]',
			})[entry.source.name] or string.format('[%s]', entry.source.name)
			return vim_item
		end,
	},

	-- Sorting behavior
	sorting = {
		priority_weight = 5,
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},

	-- Performance settings
	performance = {
		debounce = 60,
		throttle = 30,
		fetching_timeout = 500,
		confirm_resolve_timeout = 80,
		async_budget = 1,
		max_view_entries = 200,
	},

	-- Experimental features
	experimental = {
		-- Shows a ghost look of a selected entrie
		ghost_text = true,
	},
}

-- Special setup for git commit messages
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
	}, {
		{ name = 'buffer' },
	}),
})

require('cmp_git').setup()

-- Command-line completion for search with / and ?
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = 'buffer' } },
})

-- Command-line completion settings for :
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- Add cmp capabilities to all LSP
vim.lsp.config('*', { capabilities = require('cmp_nvim_lsp').default_capabilities() })

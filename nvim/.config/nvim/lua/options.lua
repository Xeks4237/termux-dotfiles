-- [ Core/Builtin options of NeoVim ]
-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse, Can be useful to resize splits
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Says NeoVim you have nerd font installed
vim.g.have_nerd_font = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true

-- Smart case
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Time to wait for a mapped sequence to complete (in milliseconds)
vim.o.timeoutlen = 250

-- Creates a backup file
vim.o.backup = false

-- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.writebackup = false

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Makes that cursor can't travel to next line after end of current one
vim.o.whichwrap = ''

-- Display lines as one long line
vim.o.wrap = true

-- Companion to wrap don't split words
vim.o.linebreak = false

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 2

-- Minimal number of screen columns either side of cursor if wrap is `false`
vim.o.sidescrolloff = 8

-- Set relative numbered lines
vim.o.relativenumber = false

-- Set number column width to 4 {default 4}
vim.o.numberwidth = 4

-- The number of spaces inserted for each indentation
vim.o.shiftwidth = 4

-- Changes amount of space tab characters take in n characters
vim.o.tabstop = 4

-- Number of spaces that a tab counts for while performing editing operations
vim.o.softtabstop = 4

-- Convert tabs to spaces
vim.o.expandtab = false

-- Highlight the current line
vim.o.cursorline = true

-- Force all horizontal splits to go below current window
vim.o.splitbelow = true

-- Force all vertical splits to go to the right of current window
vim.o.splitright = true

-- Creates a swapfile
vim.o.swapfile = false

-- Make indenting smarter again
vim.o.smartindent = true

-- Things like -- INSERT --
vim.o.showmode = true

-- Always show tabs
vim.o.showtabline = 2

-- Allow backspace on
vim.o.backspace = 'indent,eol,start'

-- Pop up menu height
vim.o.pumheight = 10

-- The encoding written to a file
vim.o.fileencoding = 'utf-8'

-- More space in the neovim command line for displaying messages
vim.o.cmdheight = 1

-- Copy indent from current line when starting new one
vim.o.autoindent = true

-- Makes it ask you to save file if you have unsaved changes
vim.o.confirm = true

-- Hides cmdline when it's not used
vim.o.cmdheight = 0

-- Makes nvim yo highlight spaces/tabs if there aren't symbhold after them
vim.opt.list = true

-- Don't give |ins-completion-menu| messages
vim.opt.shortmess:append 'c'

-- Hyphenated words recognized by searches
vim.opt.iskeyword:append '-'

-- Don't insert the current comment leader automatically for auto-wrapping comments using "textwidth", hitting <Enter> in insert mode, or hitting "o" or "O" in normal mode.
vim.opt.formatoptions:remove { 'c', 'r', 'o' }

-- Separate vim plugins from neovim in case vim still in use
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles'
vim.opt.runtimepath:remove '$PREFIX/share/vim/vimfiles'

-- Enables floating vistual text for code diagnoctics
vim.diagnostic.config { virtual_text = true }

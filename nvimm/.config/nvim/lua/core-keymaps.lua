-- NOTE: This file contains main keymaps of NV-GOD which are NOT related to plugins
-- Keymaps for plugins are writed in "extra-keymaps.lua" file

-- <leader> key is a main starting key for your custom NeoVim keybindings
-- In this case <leader> is Space key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps to move selected lines of code by using ALT + j OR k
-- In Normal mode:
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move Down', silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move Up', silent = true })
-- In Insert mode:
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move Down', silent = true })
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move Up', silent = true })
-- In Visual mode:
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move Down', silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move Up', silent = true })

-- Clear highlights of search by pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Makes n key to always move your cursor to the next search result
-- Makes N key to always move your cursor to the previous search result
vim.keymap.set('n', 'n', "v:searchforward ? 'n' : 'N'", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('n', 'N', "v:searchforward ? 'N' : 'n'", { expr = true, desc = 'Previous Search Result' })
vim.keymap.set('x', 'n', "v:searchforward ? 'n' : 'N'", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('x', 'N', "v:searchforward ? 'N' : 'n'", { expr = true, desc = 'Previous Search Result' })
vim.keymap.set('o', 'n', "v:searchforward ? 'n' : 'N'", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('o', 'N', "v:searchforward ? 'N' : 'n'", { expr = true, desc = 'Previous Search Result' })

-- Some keymaps to fix behavior of "Home" and "End" keys while being in tmux window/pane
vim.keymap.set({ 'n', 'v' }, '<Find>', '0')
vim.keymap.set({ 'n', 'v' }, '<Select>', '$')
vim.keymap.set({ 'i' }, '<Find>', '')
vim.keymap.set({ 'i' }, '<Select>', '')

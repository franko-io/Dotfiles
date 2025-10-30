-- Load options
require('config.options')

-- Bootstrap lazy.nvim
require('config.lazy')

-- LSP settings
require('config.lsp')

-- Clear search highlight on escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true

-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse support
vim.opt.mouse = 'a'

-- Mode display
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Indentation
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 750

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
vim.opt.inccommand = 'split'

-- Cursor line
vim.opt.cursorline = true

-- Scrolling
vim.opt.scrolloff = 10

-- Confirm before closing unsaved files
vim.opt.confirm = true

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Higlight when yanking text',
  group = vim.api.nvim_create_augroup('highilght-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

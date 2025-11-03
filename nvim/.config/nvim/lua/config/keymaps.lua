-- General
vim.keymap.set('n', '<leader>ww', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>', { desc = 'Save and quit ' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa!<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

-- Buffer navigation
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })

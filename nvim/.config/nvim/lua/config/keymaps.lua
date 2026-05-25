-- General
vim.keymap.set('n', '<leader>ww', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>', { desc = 'Save and quit ' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa!<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

-- Buffer navigation
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-- New ghostty window
vim.keymap.set('n', '<leader>og', function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == '' then
    vim.fn.jobstart({ 'ghostty', '-e', 'nvim' })
  else
    vim.fn.jobstart({ 'ghostty', '-e', 'nvim', file })
  end
  vim.cmd.bprevious()
end, { desc = 'Open current file in new Ghostty window' })

vim.keymap.set('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

vim.keymap.set('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

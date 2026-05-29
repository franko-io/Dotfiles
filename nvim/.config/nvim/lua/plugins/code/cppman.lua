return {
  'madskjeldgaard/cppman.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  enabled = false,
  config = function()
    local cppman = require('cppman')
    cppman.setup()

    vim.keymap.set('n', '<leader>cm', function()
      cppman.open_cppman_for(vim.fn.expand('<cword>'))
    end, { desc = 'Open cppman' })

    vim.keymap.set('n', '<leader>cc', function()
      cppman.input()
    end, { desc = 'Search cppman' })
  end,
}

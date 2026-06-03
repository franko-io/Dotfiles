return {
  'Wansmer/treesj',
  keys = {
    -- stylua: ignore
    { '<space>m', function() require('treesj').toggle() end, desc = 'Toggle Treesitter Join' },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup({
      max_join_length = 130,
    })
  end,
}

return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.ai').setup({ n_lines = 500 })

    require('mini.surround').setup({
      n_lines = 500,
      search_method = 'cover_or_next',
    })

    require('mini.pairs').setup()
  end,
}

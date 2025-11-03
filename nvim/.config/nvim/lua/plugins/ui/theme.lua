return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'moon',
        on_colors = function(colors)
          colors.bg = '#24273a'
        end,
        on_highlights = function(_, _) end,
      })

      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}

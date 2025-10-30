return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'moon',
        dim_inactive = false,
        lualine_bold = false,
        on_colors = function(colors)
          colors.bg = '#24273a'
        end,
      })

      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}

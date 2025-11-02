return {
  'folke/snacks.nvim',
  -- TODO: Add keybind to automatically close explorer on select such as shift+enter
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}

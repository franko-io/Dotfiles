return {
  'chrisgrieser/nvim-origami',
  event = 'VeryLazy',
  opts = {
    foldtext = {
      lineCount = {
        template = '󰁂 %d lines',
        hlgroup = 'Function',
      },
    },
    foldKeymaps = {
      setup = false,
    },
    autoFold = {
      enabled = true,
      kinds = { 'imports' },
    },
  },

  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
}

return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    picker = {
      layout = {
        preset = 'default',
      },
      matcher = {
        frecency = true,
      },
      layouts = {
        default = {
          layout = {
            box = 'horizontal',
            backdrop = false,
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = 'vertical',
              border = true,
              title = '{title} {live} {flags}',
              { win = 'input', height = 1, border = 'bottom' },
              { win = 'list', border = 'none' },
            },
            { win = 'preview', title = '{preview}', border = true, width = 0.5 },
          },
        },
        ivy = {
          layout = {
            box = 'vertical',
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.4,
            border = true,
            title = ' {title} {live} {flags}',
            title_pos = 'left',
            { win = 'input', height = 1, border = 'bottom' },
            {
              box = 'horizontal',
              { win = 'list', border = 'none' },
              { win = 'preview', title = '{preview}', width = 0.6, border = 'left' },
            },
          },
        },
        vertical = {
          layout = {
            backdrop = false,
            width = 0.4,
            min_width = 50,
            height = 0.4,
            min_height = 20,
            box = 'vertical',
            border = true,
            title = '{title} {live} {flags}',
            title_pos = 'center',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
            { win = 'preview', title = '{preview}', height = 0.1, border = 'top' },
          },
        },
        vscode = {
          hidden = { 'preview' },
          layout = {
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.4,
            border = true,
            box = 'vertical',
            { win = 'input', height = 1, border = true, title = '{title} {live} {flags}', title_pos = 'center' },
            { win = 'list', border = 'hpad' },
            { win = 'preview', title = '{preview}', border = true },
          },
        },
      },
    },
  },
}

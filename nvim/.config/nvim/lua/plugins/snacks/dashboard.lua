return {
  'folke/snacks.nvim',
  opts = function()
    local has_space = vim.o.columns >= 100 and vim.o.lines >= 40

    return {
      dashboard = {
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            {
              icon = ' ',
              key = 'F',
              desc = 'Find Hidden File',
              action = ":lua Snacks.dashboard.pick('files', {hidden = true})",
            },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = ' ',
              key = 'G',
              desc = 'Find Hidden Text',
              action = ":lua Snacks.dashboard.pick('live_grep', {hidden = true})",
            },
            { icon = ' ', key = 'p', desc = 'Projects', action = ":lua Snacks.dashboard.pick('projects')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = ' ',
              key = 'c',
              desc = 'Config',
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
          has_space and {
            section = 'terminal',
            cmd = 'cbonsai --live --time=0.01 --life=42',
            pane = 2,
            height = math.floor(vim.o.lines * 0.75),
            width = math.floor(vim.o.columns * 0.40),
          } or nil,
        },
      },
    }
  end,
}

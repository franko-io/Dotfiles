return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
    signs_staged = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
    },
    on_attach = function(buffer)
      local gs = require('gitsigns')

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
      end

      -- stylua: ignore start
      -- Navigation
      map('n', ']g', function() if vim.wo.diff then vim.cmd.normal({ ']c', bang = true }) else gs.nav_hunk('next') end end, 'Next Hunk')
      map('n', '[g', function() if vim.wo.diff then vim.cmd.normal({ '[c', bang = true }) else gs.nav_hunk('prev') end end, 'Prev Hunk')
      map('n', ']G', function() gs.nav_hunk('last') end, 'Last Hunk')
      map('n', '[G', function() gs.nav_hunk('first') end, 'First Hunk')

      -- Actions
      map('n', '<leader>ghs', gs.stage_hunk, 'Stage/unstage Hunk')
      map('n', '<leader>ghr', gs.reset_hunk, 'Reset Hunk')
      map('v', '<leader>ghs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Stage Hunk')
      map('v', '<leader>ghr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Reset Hunk')
      map('n', '<leader>ghS', gs.stage_buffer, 'Stage Buffer')
      map('n', '<leader>ghR', gs.reset_buffer, 'Reset Buffer')
      map('n', '<leader>ghp', gs.preview_hunk_inline, 'Preview Hunk Inline')
      map('n', '<leader>ghP', gs.preview_hunk, 'Preview Hunk Popup')
      map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame Line')
      map('n', '<leader>ghB', gs.blame, 'Blame Buffer')
      map('n', '<leader>ghd', function() gs.diffthis(nil, { vertical = true, split = 'belowright' }) end, 'Diff This')
      map('n', '<leader>ghD', function() gs.diffthis('~', { vertical = true, split = 'belowright' }) end, 'Diff This ~')
      map('n', '<leader>ghq', gs.setqflist, 'Hunks to Quickfix')
      map('n', '<leader>ghQ', function() gs.setqflist('all') end, 'All Hunks to Quickfix')

      -- Toggles
      map('n', '<leader>gtb', gs.toggle_current_line_blame, 'Toggle Line Blame')
      map('n', '<leader>gtw', gs.toggle_word_diff, 'Toggle Word Diff')
      -- stylua: ignore end
    end,
  },
}

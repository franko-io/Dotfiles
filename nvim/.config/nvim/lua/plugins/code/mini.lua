return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.ai').setup({
      n_lines = 500,
      custom_textobjects = {
        d = { '%d+' },
        D = { '%d+%.?%d*' },
      },
    })

    require('mini.surround').setup({
      n_lines = 500,
      search_method = 'cover_or_next',
    })

    require('mini.pairs').setup()
    require('mini.trailspace').setup()

    -- Disable highlighting for dashboard
    vim.b.minitrailspace_disable = true
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft == 'snacks_dashboard' or ft == '' or ft == 'lazy' then
          vim.b[args.buf].minitrailspace_disable = true
          pcall(require('mini.trailspace').unhighlight)
        else
          vim.b[args.buf].minitrailspace_disable = false
          pcall(require('mini.trailspace').highlight)
        end
      end,
    })

    -- Keymaps for mini.trailspace
    vim.keymap.set('n', '<leader>he', function()
      require('mini.trailspace').highlight()
    end, { desc = 'Highlight trailing whitespace' })

    vim.keymap.set('n', '<leader>hd', function()
      require('mini.trailspace').unhighlight()
    end, { desc = 'Unhighlight trailing whitespace' })

    vim.keymap.set('n', '<leader>ht', function()
      require('mini.trailspace').trim()
    end, { desc = 'Trim trailing whitespace' })

    vim.keymap.set('n', '<leader>hT', function()
      require('mini.trailspace').trim_last_lines()
    end, { desc = 'Trim last blank lines' })
  end,
}

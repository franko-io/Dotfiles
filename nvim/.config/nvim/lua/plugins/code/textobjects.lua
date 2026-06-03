return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  event = 'BufReadPost',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    -- Configuration (only non-keymap options go here)
    require('nvim-treesitter-textobjects').setup({
      select = {
        lookahead = true,
        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer'] = 'V',
          ['@class.outer'] = '<c-v>',
        },
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    })

    local select = require('nvim-treesitter-textobjects.select')
    local swap = require('nvim-treesitter-textobjects.swap')
    local move = require('nvim-treesitter-textobjects.move')

    -- stylua: ignore start
    -- ── Select ─────────────────────────────────────────────────────────
    vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end, { desc = 'Select outer function' })
    vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end, { desc = 'Select inner function' })
    vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end, { desc = 'Select outer class' })
    vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end, { desc = 'Select inner class' })
    vim.keymap.set({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', 'textobjects') end, { desc = 'Select outer parameter' })
    vim.keymap.set({ 'x', 'o' }, 'ia', function() select.select_textobject('@parameter.inner', 'textobjects') end, { desc = 'Select inner parameter' })
    vim.keymap.set({ 'x', 'o' }, 'al', function() select.select_textobject('@loop.outer', 'textobjects') end, { desc = 'Select outer loop' })
    vim.keymap.set({ 'x', 'o' }, 'il', function() select.select_textobject('@loop.inner', 'textobjects') end, { desc = 'Select inner loop' })
    vim.keymap.set({ 'x', 'o' }, 'ai', function() select.select_textobject('@conditional.outer', 'textobjects') end, { desc = 'Select outer conditional' })
    vim.keymap.set({ 'x', 'o' }, 'ii', function() select.select_textobject('@conditional.inner', 'textobjects') end, { desc = 'Select inner conditional' })

    -- ── Swap ───────────────────────────────────────────────────────────
    vim.keymap.set('n', '<leader>a', function() swap.swap_next('@parameter.inner') end, { desc = 'Swap next parameter' })
    vim.keymap.set('n', '<leader>A', function() swap.swap_previous('@parameter.inner') end, { desc = 'Swap previous parameter' })

    -- ── Move ───────────────────────────────────────────────────────────
    vim.keymap.set({ 'n', 'x', 'o' }, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']c', function() move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next class start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']a', function() move.goto_next_start('@parameter.inner', 'textobjects') end, { desc = 'Next parameter start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end, { desc = 'Next function end' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']C', function() move.goto_next_end('@class.outer', 'textobjects') end, { desc = 'Next class end' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Previous function start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[c', function() move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Previous class start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[a', function() move.goto_previous_start('@parameter.inner', 'textobjects') end, { desc = 'Previous parameter start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end, { desc = 'Previous function end' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[C', function() move.goto_previous_end('@class.outer', 'textobjects') end, { desc = 'Previous class end' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']i', function() move.goto_next('@conditional.outer', 'textobjects') end, { desc = 'Next conditional' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[i', function() move.goto_previous('@conditional.outer', 'textobjects') end, { desc = 'Previous conditional' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']l', function() move.goto_next('@loop.outer', 'textobjects') end, { desc = 'Next loop' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[l', function() move.goto_previous('@loop.outer', 'textobjects') end, { desc = 'Previous loop' })

    -- ── Repeatable moves ───────────────────────────────────────────────
    local r = require('nvim-treesitter-textobjects.repeatable_move')
    vim.keymap.set({ 'n', 'x', 'o' }, ';', r.repeat_last_move_next, { desc = 'Repeat next move' })
    vim.keymap.set({ 'n', 'x', 'o' }, ',', r.repeat_last_move_previous, { desc = 'Repeat previous move' })

    -- Make f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', r.builtin_f_expr, { expr = true, desc = 'Repeatable f' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', r.builtin_F_expr, { expr = true, desc = 'Repeatable F' })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', r.builtin_t_expr, { expr = true, desc = 'Repeatable t' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', r.builtin_T_expr, { expr = true, desc = 'Repeatable T' })
    -- stylua: ignore end
  end,
}

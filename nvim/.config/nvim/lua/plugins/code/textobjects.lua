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
    vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ia', function() select.select_textobject('@parameter.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'al', function() select.select_textobject('@loop.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'il', function() select.select_textobject('@loop.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ai', function() select.select_textobject('@conditional.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ii', function() select.select_textobject('@conditional.inner', 'textobjects') end)

    -- ── Swap ───────────────────────────────────────────────────────────
    vim.keymap.set('n', '<leader>a', function() swap.swap_next('@parameter.inner') end)
    vim.keymap.set('n', '<leader>A', function() swap.swap_previous('@parameter.inner') end)

    -- ── Move ───────────────────────────────────────────────────────────
    vim.keymap.set({ 'n', 'x', 'o' }, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']c', function() move.goto_next_start('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']a', function() move.goto_next_start('@parameter.inner', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']C', function() move.goto_next_end('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[c', function() move.goto_previous_start('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[a', function() move.goto_previous_start('@parameter.inner', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[C', function() move.goto_previous_end('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']i', function() move.goto_next('@conditional.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[i', function() move.goto_previous('@conditional.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']l', function() move.goto_next('@loop.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[l', function() move.goto_previous('@loop.outer', 'textobjects') end)

    -- ── Repeatable moves ───────────────────────────────────────────────
    local r = require('nvim-treesitter-textobjects.repeatable_move')
    vim.keymap.set({ 'n', 'x', 'o' }, ';', r.repeat_last_move_next)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', r.repeat_last_move_previous)

    -- Make f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', r.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', r.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', r.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', r.builtin_T_expr, { expr = true })
    -- stylua: ignore end
  end,
}

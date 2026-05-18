-- NOTE: Disabled since not using R
return {
  'jpalardy/vim-slime',
  enabled = false,
  init = function()
    vim.g.slime_target = 'tmux'
    vim.g.slime_no_mappings = true
  end,
  config = function()
    vim.g.slime_default_config = {
      socket_name = 'default',
      target_pane = '{last}',
    }

    vim.g.slime_dont_ask_default = 1
    vim.g.slime_preserve_curpos = 1
    vim.g.slime_bracketed_paste = 1

    vim.keymap.set('n', '<leader>r', '<Plug>SlimeMotionSend', { remap = true, silent = false })
    vim.keymap.set('n', '<leader>rs', '<Plug>SlimeLineSend', { remap = true, silent = false })
    vim.keymap.set('x', '<leader>rs', '<Plug>SlimeRegionSend', { remap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', '<Plug>SlimeConfig', { remap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', '<Plug>SlimeConfig', { remap = true, silent = false })
    vim.keymap.set('n', '<leader>rb', ':%SlimeSend<CR>', { remap = true, silent = false })
  end,
}

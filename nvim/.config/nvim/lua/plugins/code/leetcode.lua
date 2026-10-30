return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  cmd = 'Leet',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lang = 'python3',

    plugins = {
      non_standalone = true,
    },

    storage = {
      home = vim.fn.stdpath('data') .. '/leetcode',
      cache = vim.fn.stdpath('cache') .. '/leetcode',
    },

    cache = {
      update_interval = 60 * 60 * 24 * 7,
    },

    editor = {
      reset_previous_code = true,
      fold_imports = true,
    },

    console = {
      open_on_runcode = true,
      dir = 'row',
      size = { width = '90%', height = '75%' },
      result = { size = '60%' },
      testcase = { virt_text = true, size = '40%' },
    },

    description = {
      position = 'left',
      width = '40%',
      show_stats = true,
    },

    logging = true,
    image_support = false,

    keys = {
      toggle = { 'q' },
      confirm = { '<CR>' },
      reset_testcases = 'r',
      use_testcase = 'U',
      focus_testcases = 'H',
      focus_result = 'L',
    },
  },
  keys = {
    { '<leader>ll', '<cmd>Leet<cr>', desc = 'LeetCode menu' },
    { '<leader>lc', '<cmd>Leet console<cr>', desc = 'LeetCode console' },
    { '<leader>lr', '<cmd>Leet run<cr>', desc = 'LeetCode run' },
    { '<leader>ls', '<cmd>Leet submit<cr>', desc = 'LeetCode submit' },
    { '<leader>ld', '<cmd>Leet desc<cr>', desc = 'LeetCode description' },
    { '<leader>lt', '<cmd>Leet tabs<cr>', desc = 'LeetCode tabs' },
    { '<leader>lL', '<cmd>Leet list<cr>', desc = 'LeetCode list' },
    { '<leader>lq', '<cmd>Leet exit<cr>', desc = 'LeetCode exit' },
  },
}

return {
  'folke/snacks.nvim',
  -- stylua: ignore start
  keys = {
    -- General
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },

    -- Buffers
    { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.lines({ layout = "select" }) end, desc = "Search Current Buffer" },
    { "<leader>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>db", function() Snacks.bufdelete() end, desc = "Delete Buffer" },

    -- Find
    { '<leader>sf', function() Snacks.picker.files() end, desc = 'Find Files' },
    { '<leader>sF', function() Snacks.picker.files({ hidden = true }) end, desc = 'Find Files (hidden)' },
    { "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>sr", function() Snacks.picker.recent() end, desc = "Recent" },

    -- Grep
    { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
    { '<leader>sw', function() Snacks.picker.grep_word() end, desc = 'Grep word', mode = {'n', 'x'}},
    { '<leader>sG', function() Snacks.picker.grep({ hidden = true }) end, desc = 'Grep (hidden)' },

    -- Config
    { '<leader>cf', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config'), hidden = true }) end, desc = 'Find Config Files' },
    { '<leader>cg', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('config'), hidden = true }) end, desc = 'Grep Config Files' },

    -- Search
    { "<leader>sh", function() Snacks.picker.help({ layout = "ivy" }) end, desc = "Help Pages" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sk", function() Snacks.picker.keymaps({ layout = "ivy" }) end, desc = "Keymaps" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>sc", function() Snacks.picker.colorschemes({ layout = "vertical" }) end, desc = "Colorschemes" },

    -- Explorer
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { '<leader>E', function() Snacks.explorer({ cwd = vim.fn.expand('%:p:h') }) end, desc = 'Explorer (Current File)' },
    { '<leader>fe', function() Snacks.explorer({ focus = true }) end, desc = 'Focus Explorer' },

    -- Git
    { '<leader>gl', function() Snacks.lazygit() end, desc = 'Open lazygit' },
    { '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git branches' },
    { '<leader>gc', function() Snacks.lazygit.log() end, desc = 'Git log' },
    { '<leader>gg', function() Snacks.git.blame_line() end, desc = 'Git blame' },

    -- TODO Comments
    { "<leader>tT", function() Snacks.picker.todo_comments() end, desc = "Todo/Fix/Note/Etc" },
    { "<leader>tf", function() Snacks.picker.todo_comments({keywords = { "FIX" }}) end, desc = "Fix" },
    { "<leader>tt", function() Snacks.picker.todo_comments({keywords = { "TODO" }}) end, desc = "Todo" },
    { "<leader>th", function() Snacks.picker.todo_comments({keywords = { "HACK" }}) end, desc = "Hack" },
    { "<leader>tw", function() Snacks.picker.todo_comments({keywords = { "WARN" }}) end, desc = "Warning" },
    { "<leader>tp", function() Snacks.picker.todo_comments({keywords = { "PERF" }}) end, desc = "Performance" },
    { "<leader>tn", function() Snacks.picker.todo_comments({keywords = { "NOTE" }}) end, desc = "Note" },
    { "<leader>ts", function() Snacks.picker.todo_comments({keywords = { "TEST" }}) end, desc = "Test" },
  },
  -- stylua: ignore start
}

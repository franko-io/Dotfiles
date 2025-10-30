return {
  'folke/snacks.nvim',
  -- stylua: ignore start
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.lines({ layout = "select" }) end, desc = "Search Current Buffer" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },

    -- Find
    { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
    { '<leader>fF', function() Snacks.picker.files({ hidden = true }) end, desc = 'Find Files (hidden)' },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

    -- Grep
    { '<leader>gg', function() Snacks.picker.grep() end, desc = 'Grep' },
    { '<leader>gG', function() Snacks.picker.grep({ hidden = true }) end, desc = 'Grep (hidden)' },
    { "<leader>gb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },

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

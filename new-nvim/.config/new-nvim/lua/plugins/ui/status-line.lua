-- TODO: Explore
return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = ' '
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- Load LazyVim if available
    local has_lazyvim, lazyvim = pcall(require, 'lazyvim.util')

    local lualine_require = require('lualine_require')
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    -- Define icons
    local icons = {
      diagnostics = {
        Error = ' ',
        Warn = ' ',
        Info = ' ',
        Hint = ' ',
      },
      git = {
        added = ' ',
        modified = ' ',
        removed = ' ',
      },
    }

    -- Use LazyVim icons if available
    if has_lazyvim and lazyvim.config and lazyvim.config.icons then
      icons = lazyvim.config.icons
    end

    local opts = {
      options = {
        theme = 'auto',
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },

        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
          { 'filename', path = 1 },
        },
        lualine_x = {
          -- Noice command status
          {
            function()
              return require('noice').api.status.command.get()
            end,
            cond = function()
              return package.loaded['noice'] and require('noice').api.status.command.has()
            end,
            color = function()
              local hl = vim.api.nvim_get_hl(0, { name = 'Statement' })
              return { fg = hl.fg and string.format('#%06x', hl.fg) or nil }
            end,
          },
          -- Noice mode status
          {
            function()
              return require('noice').api.status.mode.get()
            end,
            cond = function()
              return package.loaded['noice'] and require('noice').api.status.mode.has()
            end,
            color = function()
              local hl = vim.api.nvim_get_hl(0, { name = 'Constant' })
              return { fg = hl.fg and string.format('#%06x', hl.fg) or nil }
            end,
          },
          -- DAP status
          {
            function()
              return '  ' .. require('dap').status()
            end,
            cond = function()
              return package.loaded['dap'] and require('dap').status() ~= ''
            end,
            color = function()
              local hl = vim.api.nvim_get_hl(0, { name = 'Debug' })
              return { fg = hl.fg and string.format('#%06x', hl.fg) or nil }
            end,
          },
          -- Lazy updates
          {
            function()
              return require('lazy.status').updates()
            end,
            cond = function()
              return package.loaded['lazy'] and require('lazy.status').has_updates()
            end,
            color = function()
              local hl = vim.api.nvim_get_hl(0, { name = 'Special' })
              return { fg = hl.fg and string.format('#%06x', hl.fg) or nil }
            end,
          },
          {
            'diff',
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return ' ' .. os.date('%R')
          end,
        },
      },
      extensions = { 'neo-tree', 'lazy', 'fzf' },
    }

    -- Add LazyVim-specific components if available
    if has_lazyvim and lazyvim.lualine then
      -- Insert root_dir at the beginning of lualine_c
      if lazyvim.lualine.root_dir then
        table.insert(opts.sections.lualine_c, 1, lazyvim.lualine.root_dir())
      end

      -- Replace filename with pretty_path if available
      if lazyvim.lualine.pretty_path then
        for i, component in ipairs(opts.sections.lualine_c) do
          if type(component) == 'table' and component[1] == 'filename' then
            opts.sections.lualine_c[i] = lazyvim.lualine.pretty_path()
            break
          end
        end
      end
    end

    -- Trouble symbols integration
    if vim.g.trouble_lualine then
      local has_trouble, trouble = pcall(require, 'trouble')
      if has_trouble then
        local symbols = trouble.statusline({
          mode = 'symbols',
          groups = {},
          title = false,
          filter = { range = true },
          format = '{kind_icon}{symbol.name:Normal}',
          hl_group = 'lualine_c_normal',
        })
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end
    end

    return opts
  end,
}

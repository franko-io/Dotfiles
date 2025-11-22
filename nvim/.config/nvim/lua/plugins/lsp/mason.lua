vim.keymap.set('n', '<leader>sm', '<cmd>Mason<cr>', { desc = 'Open Mason' })

return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      },
    },
    'neovim/nvim-lspconfig',
    'saghen/blink.cmp',
  },
  opts = {
    ensure_installed = {
      'lua_ls',
      'pyright',
      'r_language_server',
      'clangd',
    },
    servers = {},
  },
  -- NOTE: Add custom server configurations here
  config = function(_, opts)
    require('mason').setup()

    local lspconfig = require('lspconfig')
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Setup servers with custom config first
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    -- Setup mason-lspconfig with handlers in one call
    require('mason-lspconfig').setup({
      ensure_installed = opts.ensure_installed,
      automatic_installation = true,
      handlers = {
        -- Default handler for servers without custom config
        function(server_name)
          if not opts.servers[server_name] then
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end
        end,
      },
    })
  end,
}

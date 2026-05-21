local keymap = vim.keymap
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(event)
    -- Buffer local mappings
    local opts = { buffer = event.buf, silent = true }

    -- stylua: ignore start
    opts.desc = 'Show LSP references'
    keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, opts)

    opts.desc = 'Go to decleration'
    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definiton"
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    opts.desc = 'Show LSP implementations'
    keymap.set('n', 'gi', function() Snacks.picker.lsp_implementations() end, opts)

    opts.desc = 'Show LSP type definitions'
    keymap.set('n', 'gt', function() Snacks.picker.lsp_type_definitions({ format = 'markdown' }) end, opts)

    opts.desc = 'See available code actions'
    keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

    opts.desc = 'Smart rename'
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    opts.desc = 'Show buffer diagnostics'
    keymap.set('n', '<leader>dD', function() Snacks.picker.diagnostics_buffer() end, opts)

    opts.desc = 'Show line diagnostics'
    keymap.set('n', '<leader>dd', vim.diagnostic.open_float, opts)

    opts.desc = 'Go to previous diagnostic'
    keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, opts)

    opts.desc = 'Go to next diagnostic'
    keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, opts)

    opts.desc = 'Show hover documentation'
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    opts.desc = 'Show workspace symbols'
    keymap.set('n', '<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end, opts)
    -- stylua: ignore end
  end,
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = ' ',
      [severity.WARN] = ' ',
      [severity.HINT] = '󰠠 ',
      [severity.INFO] = ' ',
    },
  },
})

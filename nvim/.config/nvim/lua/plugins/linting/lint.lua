return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    -- Configure cpplint with custom arguments
    lint.linters.cpplint.args = {
      '--linelength=78',
      '--filter=-whitespace/braces, -legal/copyright',
    }

    lint.linters_by_ft = {
      cpp = { 'cpplint', 'cppcheck' },
    }

    -- Create autocmd to trigger linting
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

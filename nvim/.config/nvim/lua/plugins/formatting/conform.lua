local format_on_save_exclude = { 'r', 'cpp' }

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    if vim.tbl_contains(format_on_save_exclude, vim.bo[args.buf].filetype) then
      return
    end
    require('conform').format({ bufnr = args.buf })
  end,
})

vim.keymap.set({ 'n', 'v' }, '<leader>fr', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'Format buffer' })

return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      html = { 'prettier' },
      r = { 'styler' },
      cpp = { 'clang-format' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      rust = { 'rustfmt' },
      javascript = { 'prettier' },
    },
    formatters = {
      black = {
        prepend_args = { '--line-length=120' },
      },
      isort = {
        prepend_args = { '--profile=black' },
      },
      styler = {
        command = 'Rscript',
        args = {
          '-e',
          "con <- file('stdin'); out <- styler::style_text(readLines(con)); close(con); cat(out, sep = '\n')",
        },
        stdin = true,
      },
      ['clang-format'] = {
        prepend_args = { '--style={BasedOnStyle: LLVM, BreakBeforeBraces: Allman, IndentWidth: 2, ColumnLimit: 78}' },
      },
    },
  },
}

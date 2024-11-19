require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    nix = { 'alejandra' },
    -- Conform will run multiple formatters sequentially
    python = { 'isort', 'black' },
    -- Use a sub-list to run only the first available formatter
    javascript = { 'prettier', 'prettierd' },
    php = { 'php-cs-fixer' },
    yaml = { 'yamlfmt' },
  },
  formatters = {
    ['php-cs-fixer'] = {
      command = 'php-cs-fixer',
      args = {
        'fix',
        '--rules=@PSR12', -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
        '$FILENAME',
      },
      stdin = false,
    },
  },
  format_on_save = {
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    -- local disable_filetypes = { c = true, cpp = true }
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  require('conform').format {
    async = true,
    lsp_fallback = true,
    timeout_ms = 1000,
  }
end, { desc = '[F]ormat buffer' })

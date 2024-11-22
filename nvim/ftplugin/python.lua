-- Exit if the language server isn't available
if vim.fn.executable('pyright-langserver') ~= 1 then
  return
end

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
  '.git',
}

vim.lsp.start {
  name = 'pyright-ftpplugin',
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  single_file_support = true,
  capabilities = require('user.lsp-capabilities').make_client_capabilities(),
  settings = {
    python = {
      venvPath = '.venv',
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      },
    },
  },
}

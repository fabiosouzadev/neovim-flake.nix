if vim.g.did_load_rendermarkdown_plugin then
  return
end
vim.g.did_load_rendermarkdown_plugin = true

require('render-markdown').setup {
  file_types = { 'markdown', 'codecompanion', 'Avante' },
  completions = {
    lsp = { enabled = true },
    blink = { enabled = true },
  },
}

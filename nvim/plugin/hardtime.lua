if vim.g.did_load_hardtime_plugin then
  return
end
vim.g.did_load_hardtime_plugin = true

require('hardtime').setup()

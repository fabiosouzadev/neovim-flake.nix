if vim.g.did_load_codecompanion_plugin then
  return
end
vim.g.did_load_codecompanion_plugin = true

require('codecompanion').setup {
  opts = {
    language = 'Portuguese',
  },
  strategies = {
    chat = { adapter = 'gemini' },
    inline = {
      adapter = 'gemini',
      layout = 'horizontal',
      keymaps = {
        accept_change = { modes = { n = 'ga' }, description = 'Accept the suggested change' },
        reject_change = { modes = { n = 'gx' }, description = 'Reject the suggested change' },
      },
    },
    agent = { adapter = 'gemini' },
  },
}

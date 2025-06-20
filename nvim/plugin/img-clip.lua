if vim.g.did_load_imgclip_plugin then
  return
end
vim.g.did_load_imgclip_plugin = true
require('img-clip').setup {
  filetypes = {
    codecompanion = {
      prompt_for_file_name = false,
      template = '[Image]($FILE_PATH)',
      use_absolute_path = true,
    },
  },
  keys = {
    -- suggested keymap
    { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
  },
}

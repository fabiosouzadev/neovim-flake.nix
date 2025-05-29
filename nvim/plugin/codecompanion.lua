if vim.g.did_load_codecompanion_plugin then
  return
end
vim.g.did_load_codecompanion_plugin = true

require('codecompanion').setup {
  opts = {
    language = 'portuguese',
    log_level = 'DEBUG', -- or "TRACE"
  },
  display = {
    chat = {
      show_settings = true,
    },
  },
  adapters = {
    llama3 = function()
      return require('codecompanion.adapters').extend('ollama', {
        name = 'llama3', -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = 'deepseek-coder:1.3b-instruct-q4_K_M',
            -- default = 'deepseek-coder-v2:16b',
          },
          -- num_ctx = {
          --   default = 16384,
          -- },
          -- num_predict = {
          --   default = -1,
          -- },
        },
      })
    end,
  },
  strategies = {
    -- chat = { adapter = 'gemini' },
    -- inline = {
    --   adapter = 'gemini',
    --   layout = 'horizontal',
    --   keymaps = {
    --     accept_change = { modes = { n = 'ga' }, description = 'Accept the suggested change' },
    --     reject_change = { modes = { n = 'gx' }, description = 'Reject the suggested change' },
    --   },
    -- },
    -- agent = { adapter = 'gemini' },
    -- cmd = {
    --   adapter = 'gemini',
    -- },
    chat = {
      adapter = 'llama3',
    },
    inline = {
      adapter = 'llama3',
      layout = 'horizontal',
      keymaps = {
        accept_change = { modes = { n = 'ga' }, description = 'Accept the suggested change' },
        reject_change = { modes = { n = 'gx' }, description = 'Reject the suggested change' },
      },
    },
    agent = { adapter = 'gemini' },
    cmd = {
      adapter = 'gemini',
    },
  },
}

if vim.g.did_load_avante_plugin then
  return
end
vim.g.did_load_avante_plugin = true
require('avante_lib').load()
require('avante').setup {
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  provider = 'gemini',
  cursor_applying_provider = 'gemini',
  auto_suggestions_provider = 'gemini',
  memory_summary_provider = 'gemini',
  gemini = {
    model = 'gemini-2.0-flash-lite',
  },
  -- provider = 'openai',
  -- openai = {
  --   endpoint = 'https://api.openai.com/v1',
  --   model = 'gpt-4o', -- your desired model (or use gpt-4o, etc.)
  --   timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --   temperature = 0,
  --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  -- },
}

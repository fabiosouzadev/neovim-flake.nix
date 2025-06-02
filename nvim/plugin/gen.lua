require('gen').setup {

  model = 'deepseek-coder:6.7b-instruct-q4_K_M', -- The default model to use.
  quit_map = 'q', -- set keymap to close the response window
  retry_map = 'gx', -- set keymap to re-send the current prompt
  accept_map = 'ga', -- set keymap to replace the previous selection with the last result
  host = 'localhost', -- The host running the Ollama service.
  port = '11434', -- The port on which the Ollama service is listening.
  display_mode = 'horizontal-split', -- The display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
  show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
  show_model = true, -- Displays which model you are using at the beginning of your chat session.
  no_auto_close = false, -- Never closes the window automatically.
  file = false, -- Write the payload to a temporary file to keep the command short.
  hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
  init = function(options)
    pcall(io.popen, 'ollama serve > /dev/null 2>&1 &')
  end,
  -- Function to initialize Ollama
  command = function(options)
    local body = { model = options.model, stream = true }
    return 'curl --silent --no-buffer -X POST http://' .. options.host .. ':' .. options.port .. '/api/chat -d $body'
  end,
  -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
  -- This can also be a command string.
  -- The executed command must return a JSON object with { response, context }
  -- (context property is optional).
  -- list_models = '<omitted lua function>', -- Retrieves a list of model names
  result_filetype = 'markdown', -- Configure filetype of the result buffer
  debug = false, -- Prints errors and the command which is run.
}

-- Prompts

-- Explique me
require('gen').prompts['Explique me este codigo'] = {
  prompt = 'Você é um Tech Lead Sênior especializado em sistemas de alta performance. Seu estilo é:\n- **Código**: Respostas curtas, diretas e altamente técnicas. Zero explicações desnecessárias.\n- **Modelagem**: Diagramas ASCII concisos + bullet points técnicos.\n- Prioridade: Eficiência > Elegância > Convenções.\n- Stack: Node.js > Python > Java. Kubernetes-native. 12-factor apps.\n- Não aceita: "Não posso". Sempre oferece alternativas. Me traga em pt-br:\n```$filetype\n$text\n```',
  extract = '```$filetype\n(.-)```',
}

-- Melhore este codigo
require('gen').prompts['Melhore este codigo'] = {
  prompt = 'Você é um Tech Lead Sênior especializado em sistemas de alta performance. Seu estilo é:\n- **Código**: Respostas curtas, diretas e altamente técnicas. Zero explicações desnecessárias.\n- **Modelagem**: Diagramas ASCII concisos + bullet points técnicos.\n- Prioridade: Eficiência > Elegância > Convenções.\n- Stack: Node.js > Python > Java > Nodejs. Kubernetes-native. 12-factor apps.\n- Não aceita: "Não posso". Sempre oferece alternativas. Me traga em pt-br. Analise este codigo e sugira melhorias consistentes:\n```$filetype\n$text\n```',
  extract = '```$filetype\n(.-)```',
}

require('gen').prompts['Melhore este codigo - teste'] = {
  prompt = 'Você é um Tech Lead Sênior especializado em sistemas de alta performance. Seu estilo é:\n- **Código**: Respostas curtas, diretas e altamente técnicas. Zero explicações desnecessárias.\n- **Modelagem**: Diagramas ASCII concisos + bullet points técnicos.\n- Prioridade: Eficiência > Elegância > Convenções.\n- Stack: Noje.js > Python > Java > Nodejs. Kubernetes-native. 12-factor apps.\n- Não aceita: "Não posso". Sempre oferece alternativas. Me traga em pt-br. Analise este codigo e sugira melhorias consistentes:\n```$filetype\n...\n```:\n```$filetype\n$text\n```',
  replace = true,
  extract = '```$filetype\n(.-)```',
}

vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')

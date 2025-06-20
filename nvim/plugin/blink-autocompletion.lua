if vim.g.did_load_blink_autocompletion_plugin then
  return
end
vim.g.did_load_blink_autocompletion_plugin = true

require('blink-cmp').setup {
  keymap = {
    -- 'default' (recommended) for mappings similar to built-in completions
    --   <c-y> to accept ([y]es) the completion.
    --    This will auto-import if your LSP supports it.
    --    This will expand snippets if the LSP sent a snippet.
    -- 'super-tab' for tab to accept
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- For an understanding of why the 'default' preset is recommended,
    -- you will need to read `:help ins-completion`
    --
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    --
    -- All presets have the following mappings:
    -- <tab>/<s-tab>: move to right/left of your snippet expansion
    -- <c-space>: Open menu or open docs if already open
    -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
    -- <c-e>: Hide menu
    -- <c-k>: Toggle signature help
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    preset = 'enter',

    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },
  completion = {
    menu = {
      -- Don't automatically show the completion menu
      -- auto_show = false,

      -- nvim-cmp style menu
      draw = {
        columns = {
          { 'label', 'label_description', gap = 1 },
          { 'kind_icon', 'kind', 'source_name', gap = 1 },
        },
      },
    },
    -- Show documentation when selecting a completion item
    documentation = { auto_show = true, auto_show_delay_ms = 500 },

    -- Display a preview of the selected item on the current line
    ghost_text = { enabled = true },
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    per_filetype = {
      codecompanion = { 'codecompanion' },
    },
  },

  -- See :h blink-cmp-config-fuzzy for more information
  fuzzy = { implementation = 'lua' },

  -- Use a preset for snippets, check the snippets documentation for more information
  -- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' },
  snippets = { preset = 'default' },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },
}

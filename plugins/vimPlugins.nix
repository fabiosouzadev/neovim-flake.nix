# A plugin can either be a package or an attrset, such as
# { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
#   config = <config>; # String; a config that will be loaded with the plugin
#   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
#   # or as an 'opt' plugin, that can be loaded with `:packadd!`
#   optional = <true|false>; # Default: false
#   ...
# }
{
  inputs,
  pkgs,
}:
with pkgs.vimPlugins; [
  # plugins from nixpkgs go in here.
  # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins

  #themes
  catppuccin-nvim # https://github.com/catppuccin/nvim
  rose-pine # https://github.com/rose-pine/neovim
  tokyonight-nvim # https://github.com/folke/tokyonight.nvim

  # dependecies and libraries that other plugins depend on
  sqlite-lua
  plenary-nvim
  nvim-web-devicons
  nui-nvim
  trouble-nvim
  dressing-nvim

  # telescope and extensions
  telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
  telescope-fzf-native-nvim # https://github.com/nvim-telescope/telescope-fzf-native.nvim
  telescope-ui-select-nvim

  # treesitter
  nvim-treesitter.withAllGrammars
  nvim-treesitter-context # nvim-treesitter-context
  nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
  nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/

  # git integration plugins
  diffview-nvim # https://github.com/sindrets/diffview.nvim/
  neogit # https://github.com/TimUntersberger/neogit/
  gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
  vim-fugitive # https://github.com/tpope/vim-fugitive/

  # lsp extensions
  fidget-nvim
  neodev-nvim
  typescript-tools-nvim
  nvim-lspconfig

  # nvim-cmp (autocompletion) and extensions
  # luasnip # snippets | https://github.com/l3mon4d3/luasnip/
  # nvim-cmp # https://github.com/hrsh7th/nvim-cmp
  # cmp_luasnip # snippets autocompletion extension for nvim-cmp | https://github.com/saadparwaiz1/cmp_luasnip/
  # lspkind-nvim # vscode-like LSP pictograms | https://github.com/onsails/lspkind.nvim/
  # cmp-nvim-lsp # LSP as completion source | https://github.com/hrsh7th/cmp-nvim-lsp/
  # cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
  # cmp-buffer # current buffer as completion source | https://github.com/hrsh7th/cmp-buffer/
  # cmp-path # file paths as completion source | https://github.com/hrsh7th/cmp-path/
  # cmp-nvim-lua # neovim lua API as completion source | https://github.com/hrsh7th/cmp-nvim-lua/
  # cmp-cmdline # cmp command line suggestions
  # cmp-cmdline-history # cmp command line history suggestions

  #blink-cmp (autocompletion) and extension
  blink-cmp # https://github.com/saghen/blink.cmp
  friendly-snippets # snippets autocompletion extension for blink | https://github.com/rafamadriz/friendly-snippets/

  # DAP

  # IA
  # cmp-tabnine #https://github.com/tzachar/cmp-tabnine/
  # codeium-nvim #https://github.com/Exafunction/codeium.nvim
  # sg-nvim #https://github.com/sourcegraph/sg.nvim
  # vimPlugins.ChatGPT-nvim
  avante-nvim
  codecompanion-nvim
  render-markdown-nvim # To render markdown
  img-clip-nvim #To render images;
  mini-diff # To diff

  # navigation/editing enhancement plugins
  nvim-surround # https://github.com/kylechui/nvim-surround/
  vim-tmux-navigator # https://github.com/christoomey/vim-tmux-navigator
  mini-nvim
  comment-nvim
  todo-comments-nvim
  vim-sleuth
  conform-nvim
  indent-blankline-nvim
  harpoon2
  vim-floaterm
  nvim-colorizer-lua

  #file-managers
  oil-nvim

  #sessions
  vim-obsession
  # bleeding-edge plugins from flake inputs
  # (mkNvimPlugin inputs.wf-nvim "wf.nvim") # (example) keymap hints | https://github.com/Cassin01/wf.nvim

  #Keymap hints
  which-key-nvim

  #Others
  vim-be-good
  nvzone-typr #:Typr
  # nvzone-timerly #https://github.com/nvzone/timerly :TimerlyToggle
]

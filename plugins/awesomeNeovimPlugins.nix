{
  inputs,
  pkgs,
}:
with pkgs.awesomeNeovimPlugins; [
  # for avante
  #(mkNvimPlugin inputs.avante-ia "avante.nvim")
  dressing-nvim #avante-nvim
  img-clip-nvim #avante-nvim
  render-markdown-nvim #avante-nvim
  # ^ for avante
  codecompanion-nvim
]

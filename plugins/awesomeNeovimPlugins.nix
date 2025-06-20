{
  inputs,
  pkgs,
}:
with pkgs.awesomeNeovimPlugins; [
  oxocarbon-nvim
  codecompanion-nvim
  gen-nvim
  hardtime-nvim
]

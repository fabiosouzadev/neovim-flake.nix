{
  inputs,
  pkgs,
}: let
  #Use this to create a plugin from a flake input
  mkNvimPlugin = import ./mkBuildVimPlugin.nix {inherit pkgs;};
in
  with pkgs.awesomeNeovimPlugins; [
    # for avante
    # (mkNvimPlugin inputs.avante-ia "avante.nvim")
    dressing-nvim #avante-nvim
    img-clip-nvim #avante-nvim
    render-markdown-nvim #avante-nvim
    # ^ for avante
    codecompanion-nvim
  ]

{
  inputs,
  pkgs,
}: let
  #Use this to create a plugin from a flake input
  mkNvimPlugin = import ./mkBuildVimPlugin.nix {inherit pkgs;};
in
  with pkgs.awesomeNeovimPlugins; [
    codecompanion-nvim
    # avante-nvim
  ]

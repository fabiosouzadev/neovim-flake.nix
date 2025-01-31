{
  inputs,
  pkgs,
}: let
  #Use this to create a plugin from a flake input
  mkNvimPlugin = import ./mkBuildVimPlugin.nix {inherit pkgs;};
in [
  (mkNvimPlugin inputs.nightfox-nvim "nightfox.nvim")
]

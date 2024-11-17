{
  inputs,
  pkgs,
}: let
  vimPlugins = import ./vimPlugins.nix {
    inherit inputs;
    inherit pkgs;
  };
  awesomeNeovimPlugins = import ./awesomeNeovimPlugins.nix {
    inherit inputs;
    inherit pkgs;
  };
in
  vimPlugins

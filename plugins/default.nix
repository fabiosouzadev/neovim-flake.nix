{
  inputs,
  pkgs,
}: let
  vimPlugins = import ./vimPlugins.nix {
    inherit inputs;
    inherit pkgs;
  };
  awesomeNeovimPlugins = import ./awesomeNeovimPlugins.nix {inherit pkgs;};
in
  vimPlugins ++ awesomeNeovimPlugins

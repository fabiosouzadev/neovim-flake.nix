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
  buildedPlugins = import ./buildedPlugins.nix {
    inherit inputs;
    inherit pkgs;
  };
  # add more
in
  vimPlugins ++ awesomeNeovimPlugins ++ buildedPlugins

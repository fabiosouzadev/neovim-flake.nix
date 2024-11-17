{pkgs}:
# Use this to create a plugin from a flake input
(src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    })

{pkgs}: let
  extraPacks = with pkgs; [
    # language servers, etc.
    lua-language-server
    emmet-language-server
    nil
    gopls
    emmet-ls
    pyright
    phpactor
    cargo
    # formatters
    alejandra
    stylua
    prettierd
    yamlfmt
  ];
  extraNodePacks = with pkgs.nodePackages; [
    # language servers
    bash-language-server
    diagnostic-languageserver
    dockerfile-language-server-nodejs
    typescript
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
    prettier
    intelephense
  ];
  otherPacks = with pkgs; [
    python3Packages.black
    python312Packages.isort
    php83Packages.php-cs-fixer
  ];
in
  extraPacks ++ extraNodePacks ++ otherPacks

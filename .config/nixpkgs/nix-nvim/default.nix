{ pkgs, lib, ... }:
let
  vim-plugins = import ./plugins.nix { inherit pkgs lib; };
in {
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #   }))
  # ];
  home.packages = with pkgs; [
    nodePackages.pyright tree-sitter code-minimap
    luaPackages.lua-lsp rnix-lsp nodePackages.vim-language-server
    nodePackages.yaml-language-server nodePackages.bash-language-server
    nodePackages.vscode-json-languageserver-bin
    nodePackages.vscode-html-languageserver-bin
    nodePackages.vscode-css-languageserver-bin
    rnix-lsp
  ];
  programs.neovim = {
    enable = true;
    # package = nixos-unstable.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      csv-vim
      vim-surround  # fix config
      vim-repeat
      # vim-speeddating  # makes statusline buggy??
      vim-commentary
      vim-unimpaired
      vim-sleuth  # adjusts shiftwidth and expandtab based on the current file
      vim-startify
      vim-multiple-cursors
      gundo-vim
      vim-easy-align
      vim-table-mode
      editorconfig-vim
      vim-markdown
      ansible-vim
      vim-nix
      robotframework-vim
      # vimspector
      vim-bepoptimist
      nvim-base16  # the one packaged in nixpkgs is different
      popup-nvim
      plenary-nvim
      telescope-nvim
      telescope-symbols-nvim
      # telescope-media-files  # doesn't support wayland yet
      nvim-colorizer-lua
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      lsp_extensions-nvim
      # completion-nvim
      # cmp-nvim-lsp
      nvim-cmp
      lspkind-nvim
      gitsigns-nvim
      neogit
      diffview-nvim
      bufferline-nvim
      nvim-autopairs
      galaxyline-nvim
      vim-closetag
      friendly-snippets
      vim-vsnip
      nvim-tree-lua
      nvim-web-devicons
      vim-devicons
      # vim-auto-save  # ?
      neoscroll-nvim
      # zenmode-nvim
      minimap-vim
      indent-blankline-nvim  # using my own derivation because the nixpkgs still uses the master branch
      vim-easymotion
      quick-scope
      matchit-zip
      targets-vim
      neoformat
      vim-numbertoggle
      # vim-markdown-composer
      vimwiki
      pkgs.vimwiki-markdown
      vim-python-pep8-indent
      lsp_signature-nvim
      rust-tools-nvim
      vim-plugins.keymap-layer-nvim
      vim-plugins.hydra-nvim
    ];

    extraConfig = "lua << EOF\n" + builtins.readFile ./init.lua + "\nEOF";
  };
}

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools
    emacs
    git
    tmux
    fzf
    ripgrep
    zsh
    alacritty
    gnumake
    neovim
    cmake
    xclip
    ispell
    libtool
    docker
    (lib.setPrio 0 nodePackages.prettier)
    lsof

    # LSPs
    typescript-language-server
    rust-analyzer
    clang-tools
    bash-language-server
    gopls
    lua-language-server
    pyright
    nil

    # Lang
    gcc
    nodejs
    python3
    rustc
    cargo
    go
    php84

    # Language tools
    stylua
    shfmt
    nixpkgs-fmt
    php84Packages.composer
  ];
}

{ pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs; [
    # Tools
    vim
    zsh
    oh-my-zsh
    bash
    emacs
    git
    gh
    pkgs-unstable.jujutsu
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
    lsof
    zip
    unzip
    jq
    pkg-config
    zlib
    watchman
    openssl
    curl
    sqlite
    wtype
    dnslookup
    inotify-tools
    google-chrome
    awscli2
    htop

    # Node
    (lib.setPrio 0 nodePackages.prettier)
    nodePackages.tailwindcss

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
    elixir

    # Language tools
    stylua
    shfmt
    nixpkgs-fmt
    php84Packages.composer
  ];
}

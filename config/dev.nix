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
    ghostty
    gnumake
    neovim
    cmake
    xclip
    ispell
    libtool
    docker

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

    # Language tools
    stylua
    prettier
    shfmt
    nixpkgs-fmt
  ];
}

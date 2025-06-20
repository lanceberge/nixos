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
  ];
}

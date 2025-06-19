{ pkgs, ... }:
{
  home.username = "lance";
  home.homeDirectory = "/home/lance";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    brave
    emacs
    git
    tmux
    fzf
    ripgrep
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    config = {
      terminal = "ghostty";
      modifier = "Mod4";
    };
  };

  programs.home-manager.enable = true;
}

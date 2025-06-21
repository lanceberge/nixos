{ pkgs, ... }:
{

  home.username = "lance";
  home.homeDirectory = "/home/lance";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    brave
  ];

  imports = [
    ./config/dev.nix
    ./config/polybar.nix
  ];

  programs.home-manager.enable = true;
}

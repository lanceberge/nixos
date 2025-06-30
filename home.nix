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
  ];

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };
}

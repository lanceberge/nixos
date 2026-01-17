{ pkgs, ... }:
{
  home.username = "lance";
  home.homeDirectory = "/home/lance";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    brave
    spotify
    hypridle
    firefox
  ];

  imports = [
    ./config/dev.nix
  ];

  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-key-theme-name = "Emacs";
    };
    gtk4.extraConfig = {
      gtk-key-theme-name = "Emacs";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = { };
  };
}

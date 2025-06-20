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

#   xsession.windowManager.i3 = {
#     enable = true;
#     package = pkgs.i3;
#     config = {
#       terminal = "ghostty";
#       modifier = "Mod4";
#     };
#   };
}

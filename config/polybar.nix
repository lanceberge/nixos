{ pkgs, ... }:
{
  home.packages = with pkgs; [
    polybarFull
    noto-fonts-emoji
    hack-font
  ];

  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    script = "polybar top &";
    config = {
      "bar/top" = {
        monitor = "\${env:MONITOR:}";
        width = "100%";
        height = 30;
        radius = 0;
        modules-left = "i3";
        modules-center = "date";
        modules-right = "wlan  battery  pulseaudio";
        tray-position = "right";
        tray-padding = 2;
        font-0 = "Hack Nerd Font:size=12;2";
        font-1 = "Noto Color Emoji:scale=10";
        background = "#222222";
        foreground = "#ffffff";
        border-size = 0;
        padding-left = 2;
        padding-right = 2;
        module-margin = 1;
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = true;
        label-focused = "%index%";
        label-focused-background = "#666666";
        label-focused-padding = 1;
        label-unfocused = "%index%";
        label-unfocused-padding = 1;
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%Y-%m-%d";
        time = "%I:%M %p";
        label = "%date%  %time%";
      };

      "module/wlan" = {
        type = "internal/network";
        interface = "wlan0";
        interval = 3;
        label-connected = "%essid% (%signal%)";
        label-disconnected = "WiFi: down";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT1";
        adapter = "AC";
        full-at = 98;
        label-charging = "%{T1}⚡%{T-} %percentage%%";
        label-discharging = "%{T1}🔋%{T-} %percentage%%";
        label-full = "%{T1}🔋%{T-} Full";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        label-volume = "🔊";
        label-muted = "🔇";
      };
    };
  };
}

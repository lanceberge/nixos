{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    vim
    zsh
    oh-my-zsh
    brightnessctl
    redshift
    upower
    waybar
    wofi
    hyprlock
    nautilus
    hyprshot
    adwaita-icon-theme
    swaybg
    networkmanagerapplet
    bluez
    blueman
  ];

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.hack

      dejavu_fonts
      noto-fonts-emoji
      noto-fonts
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "FiraCode Nerd Font Mono" ];
      };
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  # networking.wireless.iwd.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  services.xserver = {
    enable = false;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:ctrl_modifier";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  services.redshift = {
    enable = true;
    temperature = {
      day = 4000;
      night = 4000;
    };
    latitude = "37.2349";
    longitude = "-115.8108";
  };

  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/dotfiles/.config";
  };

  users.users.lance = {
    isNormalUser = true;
    description = "Lance";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  environment.shells = [ pkgs.zsh ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "docker"
        "kubectl"
        "vi-mode"
      ];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  system.stateVersion = "25.05";

  services.pipewire.enable = false;
  services.pulseaudio.enable = true;
  services.upower.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  systemd.user.services.docker.environment.DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
}

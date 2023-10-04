{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nvidia.nix
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # Bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking.hostName = "itm154-nix";
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  # Locales
  time.timeZone = "Asia/Kuching";
  i18n = {
    defaultLocale = "en_US.UTF-8";

    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];

    extraLocaleSettings = {
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
  };

  # Desktop environments
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.flatpak.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  security.pam.services.swaylock = {};

  # HID Devices
  services.xserver.libinput.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Printing
  services.printing.enable = true;

  # Audio and sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Users
  users.users.itm154 = {
    isNormalUser = true;
    description = "itm154";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
  };

  programs.fish.enable = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      itm154 = import ../home-manager/home.nix;
    };
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    gcc
    glxinfo
  ];

  # Environment variables
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # User Packages
  users.users.itm154.packages = with pkgs; [
    firefox
  ];

  # Fonts packages
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "IBMPlexMono"
        "FiraCode"
      ];
    })
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}

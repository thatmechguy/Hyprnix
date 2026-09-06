{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  # =========================================================================
  # ===                       IMPORTS & CORE SYSTEM                       ===
  # =========================================================================
  imports = [
    ./hardware-configuration.nix
    inputs.noctalia-greeter.nixosModules.default
    ./modules/networking.nix
    ./modules/package_manager.nix
    ./modules/hardware_and_nvidia.nix
    ./modules/packages.nix
    ./modules/system_apps.nix
  ];
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;


  # =========================================================================
  # ===                        STORAGE & FILESYSTEMS                      ===
  # =========================================================================
  fileSystems."/mnt/Games" = {
    device = "/dev/disk/by-label/Games";
    fsType = "ext4";
    options = [
      "nofail"
      "x-gvfs-show"
    ];
  };

  programs.gnome-disks.enable = true;
  services.udisks2.enable = true;
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  programs.localsend.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.fstrim.enable = true;
  services.fstrim.interval = "weekly";

  # =========================================================================
  # ===                        LOCALIZATION & TIME                        ===
  # =========================================================================
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # =========================================================================
  # ===                     DISPLAY & WINDOW MANAGEMENT                   ===
  # =========================================================================
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];


  # =========================================================================
  # ===                          AUDIO & PRINTING                         ===
  # =========================================================================
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  services.ipp-usb.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # =========================================================================
  # ===                           VIRTUALISATION                          ===
  # =========================================================================
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
    programs.virt-manager.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # Allows Podman to answer to 'docker' commands
  };

  # =========================================================================
  # ===                           USER ACCOUNTS                           ===
  # =========================================================================
  users.users."chirayu" = {
    isNormalUser = true;
    description = "chirayu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "libvirtd"
      "adbusers"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # =========================================================================
  # ===                           STATE VERSION                           ===
  # =========================================================================
  system.stateVersion = "26.05";
}

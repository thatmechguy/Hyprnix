{ pkgs, inputs, ... }:

{
  nix.settings = {
    substituters = [
      "https://cache.nixos-cuda.org"
    ];
    trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      # xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk];
  };


  # =========================================================================
  # ===                        SYSTEM PACKAGES LIST                       ===
  # =========================================================================
  environment.systemPackages = with pkgs; [
    bibata-cursors
    cmake
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
    gcc
    gdb
    clang-tools
    gnumake
    goverlay
    librewolf
    lutris
    mangohud
    nautilus
    nerd-fonts."m+"
    nix-output-monitor
    papirus-folders
    papirus-icon-theme
    protonplus
    python313
    udiskie
    vscodium

    # virt-manager
    dnsmasq

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    loupe
    papers
    flatpak
    kdePackages.okular
    vlc
    smartmontools
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    distrobox
    gnome-text-editor
    libnotify
    protontricks
    nexusmods-app
    gtk3
    _7zip-zstd
    # xwayland-satellite
    ffmpeg
    flutter
    android-tools
    # android-studio
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "nexusmods-app-0.21.1"
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # ======================================================
  # ======            FLATPAK                       ======
  # ======================================================
  services.flatpak.enable = true;
}

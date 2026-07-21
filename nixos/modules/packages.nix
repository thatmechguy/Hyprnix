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
  ];


  # ======================================================
  # ======            FLATPAK                       ======
  # ======================================================
  services.flatpak.enable = true;
}

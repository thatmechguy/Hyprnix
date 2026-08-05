{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  # =========================================================================
  # ===                        SYSTEM APPLICATIONS                        ===
  # =========================================================================
  programs.firefox.enable = true;

  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    package = pkgs.millennium-steam;
  };

  programs.obs-studio = {
    enable = true;
    # package = pkgs.obs-studio.override {
    #   cudaSupport = true;
    # };
  };

  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
    greeter-args = "";
    settings = {
      output = {
        scale = 1;
      };
      cursor = {
        theme = "Adwaita";
        size = 24;
      };
      keyboard = {
        layout = "us";
      };
    };
  };
}

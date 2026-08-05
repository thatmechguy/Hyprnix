{
  # =========================================================================
  # ===                            FLAKE INPUTS                           ===
  # =========================================================================
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Official Hyprland input
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "hyprland.cachix.org-1:a7HPpC97n22A03WSiEj35LgGyLDp64561IP2SqA3ynE="
    ];
  };

  # =========================================================================
  # ===                            FLAKE OUTPUTS                          ===
  # =========================================================================
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      # =========================================================================
      # ===                         NIXOS CONFIGURATIONS                      ===
      # =========================================================================
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./configuration.nix
          ./hardware-configuration.nix

          home-manager.nixosModules.home-manager

          # =========================================================================
          # ===                         HOME-MANAGER CONFIG                       ===
          # =========================================================================
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };

            home-manager.users.thatmechguy = import ./home.nix;
          }
        ];
      };
    };
}

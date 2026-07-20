{
  # =========================================================================
  # ===                            FLAKE INPUTS                           ===
  # =========================================================================
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

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
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  # =========================================================================
  # ===                            FLAKE OUTPUTS                          ===
  # =========================================================================
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-cachyos-kernel,
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
          {
            nixpkgs.overlays = [ nix-cachyos-kernel.overlay ];
            }

          ./configuration.nix
          ./hardware-configuration.nix

          home-manager.nixosModules.home-manager

          # =========================================================================
          # ===                         HOME-MANAGER CONFIG                        ===
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

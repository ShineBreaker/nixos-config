{
  description = "self-using configuration.";

  inputs = {
    flake-compat.url = "github:NixOS/flake-compat";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minecraft-plymouth-theme = {
      url = "github:nikp123/minecraft-plymouth-theme";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };

    };

    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };

    };

    winapps = {
      url = "github:winapps-org/winapps";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };

    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self, nixpkgs, ... }@inputs:

    (
      let
        system = "x86_64-linux";
        username = "brokenshine";

        genRev = {
          system.configurationRevision = self.rev or null;
          system.nixos.label =
            with builtins;
            if self.sourceInfo ? lastModifiedDate && self.sourceInfo ? shortRev then
              "${substring 0 8 self.sourceInfo.lastModifiedDate}.${self.sourceInfo.shortRev}"
            else
              "dirty";
        };

      in

      {
        nixosConfigurations.BrokenShine-Desktop = nixpkgs.lib.nixosSystem {

          inherit system;

          modules = [
            ./configuration/00-main/system.nix
            ./configuration/00-main/services.nix
            ./configuration/device/platform/RBP162024.nix
            (import ./overlays)

            {
              nixpkgs.overlays = [
                inputs.nix-cachyos-kernel.overlay
              ];

              environment.systemPackages = [
                inputs.winapps.packages."${system}".winapps
              ];

              networking.firewall = {
                allowedUDPPorts = [ 3389 ];
                allowedTCPPorts = [ 3389 ];
              };
            }

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users."${username}" = {
                  imports = [
                    inputs.zen-browser.homeModules.twilight

                    ./configuration/00-main/home.nix
                  ];
                };

                backupFileExtension = "backup";
                overwriteBackup = true;
                verbose = true;
              };
            }

            inputs.lanzaboote.nixosModules.lanzaboote
            (
              { pkgs, lib, ... }:
              {
                environment.systemPackages = [
                  pkgs.sbctl
                ];
                boot.loader.systemd-boot.enable = lib.mkForce false;
                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/var/lib/sbctl";
                };
              }
            )

            inputs.nix-index-database.nixosModules.nix-index
            {
              programs.nix-index.enable = true;
              programs.nix-index-database.comma.enable = true;
            }

            inputs.solaar.nixosModules.solaar
            {
              services.solaar = {
                enable = true;
                window = "hide";
                batteryIcons = "symbolic";
              };
            }

            inputs.minecraft-plymouth-theme.nixosModules.default
            {
              boot.plymouth.plymouth-minecraft-theme.enable = true;
            }

            inputs.stylix.nixosModules.stylix
            (
              { ... }:
              {
                imports = [ ./configuration/system/stylix.nix ];
              }
            )

            genRev
          ];
        };
      }
    );
}

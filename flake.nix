{
  description = "self-using configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };

    # dankMaterialShell = {
    #   url = "github:AvengeMedia/DankMaterialShell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.quickshell.follows = "quickshell";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

  };

  outputs =
    {
      chaotic,
      # dankMaterialShell,
      home-manager,
      niri-flake,
      nix-index-database,
      noctalia,
      quickshell,
      solaar,
      stylix,
      winapps,

      nixpkgs,
      self,
      ...
    }:

    (
      let
        system = "x86_64-linux";
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

            {
              environment.systemPackages = [
                winapps.packages."${system}".winapps
              ];
            }

            (import ./overlays)

            noctalia.nixosModules.default
            {
              environment.systemPackages = [
                noctalia.packages."${system}".default
                quickshell.packages."${system}".default
              ];

              services.noctalia-shell.enable = true;
            }

            niri-flake.nixosModules.niri
            (
              { lib, ... }:
              {
                niri-flake.cache.enable = true;
                nixpkgs.overlays = [ niri-flake.overlays.niri ];

                # Shit niri-flake.
                services.gnome.gnome-keyring.enable = lib.mkForce false;
              }
            )

            home-manager.nixosModules.home-manager

            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users."brokenshine" = {
                  imports = [
                    # dankMaterialShell.homeModules.dankMaterialShell.default
                    # dankMaterialShell.homeModules.dankMaterialShell.niri

                    noctalia.homeModules.default

                    ./configuration/00-main/home.nix
                  ];
                };

                backupFileExtension = "backup";
                overwriteBackup = true;
                verbose = true;
              };
            }

            nix-index-database.nixosModules.nix-index
            {
              programs.nix-index.enable = true;
              programs.nix-index-database.comma.enable = true;
            }

            chaotic.nixosModules.default
            {
              chaotic.mesa-git = {
                enable = true;
                replaceBasePackage = true;
              };
            }

            solaar.nixosModules.solaar
            {
              services.solaar = {
                enable = true;
                window = "hide";
                batteryIcons = "symbolic";
              };
            }

            stylix.nixosModules.stylix
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

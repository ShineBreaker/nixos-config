{
  description = "self-using configuration.";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      lanzaboote,
      chaotic,
      nix-index-database,
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
            ./configuration/device/RBP162024.nix

            chaotic.nixosModules.default
            {
              chaotic.mesa-git.enable = true;
            }

            lanzaboote.nixosModules.lanzaboote
            (
              { pkgs, lib, ... }:
              {

                environment.systemPackages = [
                  # For debugging and troubleshooting Secure Boot.
                  pkgs.sbctl
                ];

                # Lanzaboote currently replaces the systemd-boot module.
                # This setting is usually set to true in configuration.nix
                # generated at installation time. So we force it to false
                # for now.
                boot.loader.systemd-boot.enable = lib.mkForce false;

                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/var/lib/sbctl";
                };
              }
            )

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."brokenshine".imports = [
                ./configuration/00-main/home.nix
              ];

              home-manager.backupFileExtension = "backup";
            }

            nix-index-database.nixosModules.nix-index
            {
              programs.nix-index.enable = true;
              programs.nix-index-database.comma.enable = true;
            }

            genRev
          ];
        };
      }
    );
}

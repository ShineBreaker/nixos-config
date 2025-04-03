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

  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, ... }:

    (let
      system = "x86_64-linux";
      genRev = {
        system.configurationRevision = self.rev or null;
        system.nixos.label =
          with builtins;
            if self.sourceInfo ? lastModifiedDate && self.sourceInfo ? shortRev
            then "${substring 0 8 self.sourceInfo.lastModifiedDate}.${self.sourceInfo.shortRev}"
            else "dirty";
      };

    in {
      nixosConfigurations.BrokenShine-Desktop = nixpkgs.lib.nixosSystem {
      
        inherit system;

        modules = [
          ./configuration/system.nix
          ./configuration/private/user.nix
          ./configuration/programs.nix
          ./configuration/desktop/niri.nix
          ./configuration/device/RBP162024.nix

          home-manager.nixosModules.home-manager
     	    {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brokenshine = import ./configuration/private/home.nix;
            home-manager.backupFileExtension = "backup";
           }

          lanzaboote.nixosModules.lanzaboote

          ({ pkgs, lib, ... }: {

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
              pkiBundle = "/etc/secureboot";
            };
          })

          genRev
        ];
      };
	  
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      
        inherit system;

        modules = [
          ./configuration/system.nix
          ./configuration/user.nix
          ./configuration/programs.nix
          ./configuration/desktop/niri.nix

          home-manager.nixosModules.home-manager
     	    {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brokenshine = import ./configuration/home.nix;
            home-manager.backupFileExtension = "backup";
           }

          lanzaboote.nixosModules.lanzaboote

          ({ pkgs, lib, ... }: {

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
              pkiBundle = "/etc/secureboot";
            };
          })

          genRev
        ];
    };
  });
}

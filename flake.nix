{
  description = "self-using configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      chaotic,
      home-manager,
      niri-flake,
      nix-index-database,
      dankMaterialShell,
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
            ./configuration/device/RBP162024.nix
            
            (import ./overlays)

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
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."brokenshine".imports = [
                dankMaterialShell.homeModules.dankMaterialShell

                ./configuration/00-main/home.nix
              ];

              home-manager.backupFileExtension = "backup";
            }

            nix-index-database.nixosModules.nix-index
            {
              programs.nix-index.enable = true;
              programs.nix-index-database.comma.enable = true;
            }

            chaotic.nixosModules.default
            {
              chaotic.mesa-git.enable = true;
            }

            genRev
          ];
        };
      }
    );
}

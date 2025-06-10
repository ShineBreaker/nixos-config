{
  description = "self-using configuration.";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { self, nixpkgs, home-manager, ... }:

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
          ./configuration/00-main/system.nix
          ./configuration/00-main/services.nix
          ./configuration/device/RBP162024.nix

          home-manager.nixosModules.home-manager
     	    {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."brokenshine".imports = [
              ./configuration/00-main/home.nix
            ];
            
            home-manager.backupFileExtension = "backup";
           }

          genRev
        ];
    };
  });
}

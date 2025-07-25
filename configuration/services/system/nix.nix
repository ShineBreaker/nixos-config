{ config, pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  nix = {
    package = pkgs.lixPackageSets.git.lix;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "brokenshine"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      builders-use-substitutes = true;
      keep-derivations = true;
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        # "https://mirror.sjtu.edu.cn/nix-channels/store"
        # "https://mirror.nju.edu.cn/nix-channels/store"
        # "https://mirrors.sustech.edu.cn/nix-channels/store"
        # "https://mirror.iscas.ac.cn/nix-channels/store"
        # "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"

        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

}

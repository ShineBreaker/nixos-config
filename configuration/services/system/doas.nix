{
  config,
  lib,
  pkgs,
  ...
}:
{
  security.sudo.enable = lib.mkForce false;
  security.doas = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "brokenshine" ];
        noPass = true;
        keepEnv = true;
      }
    ];
  };

  environment.systemPackages = with pkgs; [ doas-sudo-shim ];
  programs.fish.shellAbbrs = {
    sudo = "doas";
  };
}

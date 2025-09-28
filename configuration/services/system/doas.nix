{
  lib,
  pkgs,
  ...
}:
{
  security.doas = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "brokenshine" ];
        noPass = false;
        keepEnv = false;
        persist = true;
      }
    ];
  };

  environment.systemPackages = with pkgs; [ doas-sudo-shim ];
  programs.fish.shellAbbrs = {
    sudo = "doas";
  };
}

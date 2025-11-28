{
  pkgs,
  ...
}:
{
  security.sudo.enable = false;

  security.doas = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "brokenshine" ];
        noPass = false;
        keepEnv = true;
        persist = true;
      }
    ];
  };

  environment.systemPackages = with pkgs; [ doas-sudo-shim ];

  programs.fish.shellAbbrs = {
    sudo = "doas";
  };

  security.pam.services = {
    "doas".fprintAuth = false;
  };
}

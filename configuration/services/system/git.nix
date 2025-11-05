{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git-credential-keepassxc
    gitui
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config.credential = {
      helper = "libsecret";
      credentialStore = "cache";
    };
  };
  users.users.brokenshine.extraGroups = [ "networkmanager" ];
}

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
    config = {
      user = {
        name = "BrokenShine";
        email = "brokenshine@noreply.codeberg.org";
        signingkey = "62711D5E9CCDEC6907CADBF88637132222571907";
      };
      commit.gpgSign = true;
      credential = {
        credential.helper = "keepassxc --git-groups";
        credentialStore = "cache";
      };
    };
  };
  users.users.brokenshine.extraGroups = [ "networkmanager" ];
}

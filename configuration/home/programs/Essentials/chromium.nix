{
  pkgs,
  ...
}:

{
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      # ublock origin
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
    ];
    nativeMessagingHosts = with pkgs; [
      keepassxc
    ];
  };
}

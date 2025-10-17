{
  pkgs,
  ...
}:

{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = [
      # ublock origin
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
    ];
    nativeMessagingHosts = with pkgs; [
      keepassxc
    ];
  };
}

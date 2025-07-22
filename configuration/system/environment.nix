{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    fastfetch
    uv
    isd
    gcc

    unzip
    unrar
    p7zip

    bibata-cursors
  ];

  environment.localBinInPath = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
  };
}

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    fastfetch
    uv
    isd

    unzip
    unrar
    p7zip

    sof-firmware
  ];

  environment.localBinInPath = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
  };
}

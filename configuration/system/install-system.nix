{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    fastfetch
    pyenv

    unzip
    unrar
    p7zip

    sof-firmware
  ];
}

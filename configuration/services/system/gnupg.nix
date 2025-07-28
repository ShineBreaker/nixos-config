{ ... }:
{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
    enableBrowserSocket = true;
  };

  security.pam.services.brokenshine.enableGnomeKeyring = true;

  services.passSecretService.enable = true;
}

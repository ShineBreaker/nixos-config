{
  ...
}:

{
  services.pass-secret-service.enable = true;

  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      Browser = {
        Enabled = true;
        UpdateBinaryPath = false;
      };

      FdoSecrets = {
        Enabled = true;
      };

      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "classic";
        CompactMode = true;
        HidePasswords = true;
        Language = "zh_CN";
        MinimizeOnStartup = true;
        MinimizeToTray = true;
        ShowTrayIcon = true;
        ToolButtonStyle = "4";
        TrayIconAppearance = "monochrome-light";
      };

      SSHAgent.Enabled = true;
    };
  };

  programs.git-credential-keepassxc = {
    enable = true;
    hosts = [
      "https://github.com"
      "https://gitee.com"
    ];
  };
}

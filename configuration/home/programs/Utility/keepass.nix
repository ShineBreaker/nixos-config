{
  ...
}:

{
  services.pass-secret-service.enable = true;

  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      General = {
        ConfigVersion = 2;
        HideWindowOnCopy = true;
        MinimizeAfterUnlock = true;
      };

      Browser = {
        BestMatchOnly = true;
        Enabled = true;
        UpdateBinaryPath = false;
      };

      FdoSecrets = {
        Enabled = true;
      };

      GUI = {
        ApplicationTheme = "classic";
        ColorPasswords = true;
        Language = "zh_CN";
        MinimizeOnClose = true;
        MinimizeOnStartup = true;
        MinimizeToTray = true;
        MonospaceNotes = true;
        ShowTrayIcon = true;
        ToolButtonStyle = 4;
        TrayIconAppearance = "monochrome-light";
      };

      KeeShare = {
        Active = "<?xml version=\"1.0\"?><KeeShare><Active/></KeeShare>\n";
        Own = "<?xml version=\"1.0\"?><KeeShare><PrivateKey>MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDCB/6bEIj/3KaBIK61+D+7rM+P5YbMWuBD0GII1IfCSnW7zyve+qZYe93+j0cf89aeEYYlKw4cPgURz3cTbFH5dPR0EBjjXS5B5/gkzBzc1c9LogXQ6KcPrS9dae+8SAiz3zpMq3BfGbnArcHdbW3iWbxRUzcglhNdsdc+Gy5WcZ2DfTvfYavqabtuMIJ6XR6CMSbIxsGmIUxk+OJtJLPBdvi5NC32OZoDPC0k1/P3uup+4WV6LSzJkMkQ7QwdWUznIzgZqwT8ivdp0ruihsDK3aH7qkk2Sv84H8Iz80QVvGC4+Wzpqu7IVBr3/4SVpsChgMVfAYvCwXniM5mYsjeRAgMBAAECggEAFo16VQi/e8noWpLza7g+pDBKceXSXLdlYMx8UJ1vaDBibeF/LmxA4IEJRRjfQgIEHJxZ1MEj4zl8Ol08cHgDMTUcYs8qLWc7xLJTP+evpSV+8kITXfxkyqgtHLT/BgnzZQDZ1GaK6ariUdiAc53QC2K1xlgfTLzU5GuS4qejI63dykoXE6GYB3GPvCEhvJg/jhGJEeUzqL4yKitbmcnjmK1/MFvwy6+eskftNNPEyJD3Mj5O9O3hN0SK5U123X+yaKDv+U2ZD2uPFEyEKzu5x31Pi6ePxTqga69zTzqAAV4ig9KbOasWCZoFmGFQPHfU70rLUctIPB4rPnMb/5pbtwKBgQD95R/K6Q8HlR7sgSP2RPfgWO0eyBfradm+72xehYJWqMtU5m+zfLJpHiMj40dMkmFxt4hp7f6Q5eAFN8WuesQFRAChtzTa943BmYjMFUbjownMCIEK/tTziJDmHe+PJLRdSaS2OgHDItQpsJ4itE8m3+Z+OKJx4mhYh0fwC8JLLwKBgQDDo9A2i8zdVD9TWOXWTdQBgczF1UmT4XHzYFvpI/V13MNe7yTkJapDf+dMaSvp6MtSqVp0X3lC+kP9tSYVQ5diJGAVoPfGAUWD67EktZkW726k+BS2N4PWEojT1FpnkPYjdq/Npa+ZargtSYAt2PAtykhGBWZXpilDE1wYfw/5PwKBgQCmV0v6C7EuHZPSDVW7Tjo8QOaxiRSqxoHDZ2dPkhbvocz9ha/fHy5gUj9hjtEyqKCw+TaleCiVVBXuNTkNdB8i+AeV68r0PsYf9fA7DSGRmEqd42BwDL8GAw4zxZ8i4EBO8iW4wc5Pw2zPF4izYgCNjpmbTo2XIWeNwKvv6DRWPwKBgCZI82EJQKD7cJ0F44xplJhq50C7uXdYAe2nqLTaFZnoBs+YKvb+q/Ajoobgefh/VvKpM4tcd6V0xkNq5LX6kTBif+8bngFAlHL5d6QAaaIEXvmnlp4GBSWqYN5bSwnDY3eTLVooF1IFgV9TZ+MQ9gdv827IdbunR6HZswcULnMPAoGATi+gbogjPFMncI5dftxGG2Jbuwo0cCQ+/uxSfdACu9SV/F+RmbPv+0SmHDqWyvZqJS0AJLk4Qg8H3qInKWXTCb77yYuDsPhGMCg1QS7cgrU+hIV4s2kcLp68vtivjU1VKV2oVnHZVxxfa0zqeKAYzAlkZCUjBUafbEye/mNLHgk=</PrivateKey><PublicKey><Signer>brokenshine</Signer><Key>MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDCB/6bEIj/3KaBIK61+D+7rM+P5YbMWuBD0GII1IfCSnW7zyve+qZYe93+j0cf89aeEYYlKw4cPgURz3cTbFH5dPR0EBjjXS5B5/gkzBzc1c9LogXQ6KcPrS9dae+8SAiz3zpMq3BfGbnArcHdbW3iWbxRUzcglhNdsdc+Gy5WcZ2DfTvfYavqabtuMIJ6XR6CMSbIxsGmIUxk+OJtJLPBdvi5NC32OZoDPC0k1/P3uup+4WV6LSzJkMkQ7QwdWUznIzgZqwT8ivdp0ruihsDK3aH7qkk2Sv84H8Iz80QVvGC4+Wzpqu7IVBr3/4SVpsChgMVfAYvCwXniM5mYsjeRAgMBAAECggEAFo16VQi/e8noWpLza7g+pDBKceXSXLdlYMx8UJ1vaDBibeF/LmxA4IEJRRjfQgIEHJxZ1MEj4zl8Ol08cHgDMTUcYs8qLWc7xLJTP+evpSV+8kITXfxkyqgtHLT/BgnzZQDZ1GaK6ariUdiAc53QC2K1xlgfTLzU5GuS4qejI63dykoXE6GYB3GPvCEhvJg/jhGJEeUzqL4yKitbmcnjmK1/MFvwy6+eskftNNPEyJD3Mj5O9O3hN0SK5U123X+yaKDv+U2ZD2uPFEyEKzu5x31Pi6ePxTqga69zTzqAAV4ig9KbOasWCZoFmGFQPHfU70rLUctIPB4rPnMb/5pbtwKBgQD95R/K6Q8HlR7sgSP2RPfgWO0eyBfradm+72xehYJWqMtU5m+zfLJpHiMj40dMkmFxt4hp7f6Q5eAFN8WuesQFRAChtzTa943BmYjMFUbjownMCIEK/tTziJDmHe+PJLRdSaS2OgHDItQpsJ4itE8m3+Z+OKJx4mhYh0fwC8JLLwKBgQDDo9A2i8zdVD9TWOXWTdQBgczF1UmT4XHzYFvpI/V13MNe7yTkJapDf+dMaSvp6MtSqVp0X3lC+kP9tSYVQ5diJGAVoPfGAUWD67EktZkW726k+BS2N4PWEojT1FpnkPYjdq/Npa+ZargtSYAt2PAtykhGBWZXpilDE1wYfw/5PwKBgQCmV0v6C7EuHZPSDVW7Tjo8QOaxiRSqxoHDZ2dPkhbvocz9ha/fHy5gUj9hjtEyqKCw+TaleCiVVBXuNTkNdB8i+AeV68r0PsYf9fA7DSGRmEqd42BwDL8GAw4zxZ8i4EBO8iW4wc5Pw2zPF4izYgCNjpmbTo2XIWeNwKvv6DRWPwKBgCZI82EJQKD7cJ0F44xplJhq50C7uXdYAe2nqLTaFZnoBs+YKvb+q/Ajoobgefh/VvKpM4tcd6V0xkNq5LX6kTBif+8bngFAlHL5d6QAaaIEXvmnlp4GBSWqYN5bSwnDY3eTLVooF1IFgV9TZ+MQ9gdv827IdbunR6HZswcULnMPAoGATi+gbogjPFMncI5dftxGG2Jbuwo0cCQ+/uxSfdACu9SV/F+RmbPv+0SmHDqWyvZqJS0AJLk4Qg8H3qInKWXTCb77yYuDsPhGMCg1QS7cgrU+hIV4s2kcLp68vtivjU1VKV2oVnHZVxxfa0zqeKAYzAlkZCUjBUafbEye/mNLHgk=</Key></PublicKey></KeeShare>\n";
        QuietSuccess = true;
      };

      PasswordGenerator = {
        AdditionalChars = null;
        ExcludedChars = null;
      };

      SSHAgent = {
        Enabled = true;
      };

      Security = {
        PasswordEmptyPlaceholder = true;
      };

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

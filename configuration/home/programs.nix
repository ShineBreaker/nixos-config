{
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    proton-cachyos_x86_64_v3
    protonup-rs
    protontricks
    mangojuice
    (bottles.override {
      removeWarningPopup = true;
    })

    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.proton-cachyos_x86_64_v3
      ];
    })

    # (hmcl.override {
    #   hmclJdk = zulu17;
    #   minecraftJdks = [
    #     graalvm-ce
    #     zulu8
    #     zulu
    #   ];
    # })

    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];
      jdks = [
        graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })

    (mcaselector.override {
      jre = zulu.override {
        enableJavaFX = true;
      };
    })

    onlyoffice-desktopeditors
    wpsoffice-cn
    openutau

    gimp3-with-plugins
    inkscape-with-extensions
    kdePackages.kdenlive
    krita

    ffmpeg
    imagemagick

    nomacs
    mpv

    coppwr
    mission-center
    qtscrcpy
    baobab
    filezilla

    qq
    wechat-uos
    telegram-desktop
    thunderbird
    brave

    lapce
    nixd
    biome

    adwaita-icon-theme
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-text-pthread
      obs-vkcapture
      wlrobs
    ];
  };

  services.pass-secret-service.enable = true;
  programs.keepassxc.enable = true;

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
    ];
    themes = {
      tokyonight_transparent = {
        "inherits" = "tokyonight";
        "ui.background" = { };
        "ui.text" = { };
        "ui.help" = { };
        "ui.menu" = { };
        "ui.statusline" = { };
      };
    };
  };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    languagePacks = [ "zh-CN" ];
    nativeMessagingHosts = with pkgs; [
      keepassxc
      firefoxpwa
    ];

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;

      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = false;
      DefaultDownloadDirectory = "\${home}/Downloads";

      # EnableTrackingProtection = {
      #   Value = true;
      #   Locked = true;
      #   Cryptomining = true;
      #   Fingerprinting = true;
      # };

      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      PromptForDownloadLocation = false;

      RequestedLocales = [ "zh-CN" ];
      SanitizeOnShutdown = {
        Cache = true;
        Cookies = false;
        FormData = false;
        History = false;
        Sessions = false;
        SiteSettings = false;
        Locked = true;
      };
      SearchEngines_Default = "Bing";
    };
  };

  programs.firefoxpwa.enable = true;

  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    font = {
      package = pkgs.maple-mono.NF-CN;
      name = "Maple Mono NF CN";
      size = 11;
    };
    themeFile = "tokyo_night_night";
    settings = {
      cursor_shape = "beam";
      background_opacity = 0.8;
      background_blur = 10;
      cursor_trail = 1;
      cursor_trail_start_threshold = 0;
    };
  };
}

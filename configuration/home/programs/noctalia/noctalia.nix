{
  config,
  ...
}:

{
  programs.noctalia-shell = {
    enable = true;

    colors = with config.lib.stylix.colors; {
      mError = "#${base08}";
      mOnError = "#${base01}";
      mOnPrimary = "#${base02}";
      mOnSecondary = "#${base01}";
      mOnSurface = "#${base05}";
      mOnSurfaceVariant = "#${base05}";
      mOnTertiary = "#${base00}";
      mOutline = "#${base02}";
      mPrimary = "#${base0B}";
      mSecondary = "#${base0A}";
      mShadow = "#${base00}";
      mSurface = "#${base00}";
      mSurfaceVariant = "#${base01}";
      mTertiary = "#${base0D}";
    };

    settings = {
      settingsVersion = 16;
      setupCompleted = true;
      bar = {
        position = "left";
        backgroundOpacity = 0.9;
        density = "comfortable";
        showCapsule = true;
        floating = false;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }

            { id = "NotificationHistory"; }

            {
              hideMode = "hidden";
              id = "MediaMini";
              scrollingMode = "hover";
              showAlbumArt = false;
              showVisualizer = false;
              visualizerType = "linear";
            }

            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "name";
            }

            {
              colorizeIcons = false;
              hideMode = "hidden";
              id = "ActiveWindow";
              scrollingMode = "hover";
              showIcon = true;
              width = 145;
            }
          ];

          center = [
            {
              formatVertical = "HH  mm  ss";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = true;
            }
          ];

          right = [
            { id = "Tray"; }

            { id = "Battery"; }

            { id = "Volume"; }

            { id = "Brightness"; }

            {
              id = "SystemMonitor";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = false;
            }
          ];
        };
      };
      general = {
        dimDesktop = true;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
      };
      location = {
        name = "Guangxi; China";
        weatherEnabled = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = true;
      };
      screenRecorder = {
        directory = "${config.home.homeDirectory}/Videos/screenRecorder";
        frameRate = 60;
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "very_high";
        colorRange = "limited";
        showCursor = true;
        audioSource = "default_output";
        videoSource = "portal";
      };
      wallpaper = {
        enabled = false;
      };
      appLauncher = {
        enableClipboardHistory = true;
        position = "center";
        backgroundOpacity = 0.85;
        pinnedExecs = [ ];
        useApp2Unit = true;
        sortByMostUsed = true;
        terminalCommand = "foot";
      };
      controlCenter = {
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "ScreenRecorder";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = false;
            id = "media-sysmon-card";
          }
        ];
      };
      dock = {
        displayMode = "auto_hide";
        backgroundOpacity = 0.9;
        floatingRatio = 0;
        onlySameOutput = true;
        monitors = [ "eDP-1" ];
        pinnedApps = [ ];
        colorizeIcons = false;
      };
      network = {
        wifiEnabled = true;
      };
      notifications = {
        doNotDisturb = false;
        monitors = [ ];
        location = "top_right";
        alwaysOnTop = false;
        lastSeenTs = 0;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
      };
      osd = {
        enabled = true;
        location = "top_right";
        monitors = [ ];
        autoHideMs = 2000;
        alwaysOnTop = false;
      };
      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 60;
        visualizerType = "linear";
        mprisBlacklist = [ ];
        preferredPlayer = "";
      };
      ui = {
        fontDefault = config.stylix.fonts.sansSerif.name;
        fontFixed = config.stylix.fonts.monospace.name;
        fontDefaultScale = 1;
        fontFixedScale = 1;
        idleInhibitorEnabled = false;
        tooltipsEnabled = true;
      };
      brightness = {
        brightnessStep = 5;
      };
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Noctalia (default)";
        darkMode = true;
        generateTemplatesForPredefined = false;
      };
      templates = {
        gtk = false;
        qt = false;
        kcolorscheme = false;
        kitty = false;
        ghostty = false;
        foot = false;
        fuzzel = false;
        discord = false;
        discord_vesktop = false;
        discord_webcord = false;
        discord_armcord = false;
        discord_equibop = false;
        discord_lightcord = false;
        discord_dorion = false;
        pywalfox = false;
        enableUserTemplates = false;
      };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "22:30";
      };
      hooks = {
        enabled = false;
      };
    };
  };
}

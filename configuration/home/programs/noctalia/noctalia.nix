{
  config,
  ...
}:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 16;
      setupCompleted = true;
      bar = {
        position = "left";
        backgroundOpacity = 0.9;
        density = "comfortable";
        showCapsule = true;
        floating = true;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        widgets = {
          left = [
            {
              hideMode = "hidden";
              id = "MediaMini";
              scrollingMode = "hover";
              showAlbumArt = false;
              showVisualizer = false;
              visualizerType = "linear";
            }

            {
              id = "SystemMonitor";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = false;
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
              formatVertical = "MM dd - HH mm";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = true;
            }
          ];

          right = [

            { id = "Tray"; }

            { id = "ScreenRecorder"; }

            { id = "NotificationHistory"; }

            { id = "Battery"; }

            { id = "Volume"; }

            { id = "Brightness"; }

            {
              id = "ControlCenter";
              useDistroLogo = true;
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
        enabled = true;
        directory = "${config.home.homeDirectory}/Pictures/wallpaper";
        enableMultiMonitorDirectories = false;
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        fillColor = "#000000";
        randomEnabled = false;
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
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
            {
              id = "WallpaperSelector";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
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
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };
      dock = {
        displayMode = "always_visible";
        backgroundOpacity = 1;
        floatingRatio = 1;
        onlySameOutput = true;
        monitors = [ ];
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
        useWallpaperColors = true;
        darkMode = true;
        matugenSchemeType = "scheme-tonal-spot";
        generateTemplatesForPredefined = true;
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
        enabled = true;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "22:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
      };
      battery = {
        chargingMode = 0;
      };
    };
  };
}

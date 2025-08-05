### NixOS配置


#### 特点：
 - 使用`Lix`来替代`Nix`以获得更快的build速度
 - 使用`Doas`替换`Sudo`来获得更好的安全性
 - 使用`Fish`作为Shell，使用`Lanzaboote`来提供Secure Boot支持
 - 桌面环境为`Niri`，使用`Greetd`搭配`TuiGreeter`作为Display Manager，桌面配套的设施为`Waybar`，`GtkLock`，`Fuzzel`，`Mako`，壁纸使用`Waypaper`进行管理，安装了`swww`和`mpvpaper`两个backend，文件管理器为`Nemo`，压缩包管理器为`Peazip`，默认的输入法为`Fcitx5+Rime`
 - 默认使用`Orchis`主题，`Papirus`图标包，`Bibata`鼠标指针。启用`qt5ct`, `qt6ct`以及`Kvantum`来实现对QT主题的支持
 - 内置了几个蛮好用的TUI小工具，比如说管理任务用的`Btop`和管理Proton用的`protonup-rs`，以及一个可以监控nix-build时的软件包的程序，用法为`原本的nix代码 &| nom --json`
 - 尽量将目录树的结构理得比较清晰，以方便自己以及他人理解。

#### 注意事项：
 - Niri中的帮助按钮为`Super+Alt+空格`（Super即为win键）
 - gamescope中按照自己目前的设备配置了分辨率以及一些使用的参数，但是
   - 游戏的分辨率 **仍然需要作为参数传到gamescope中** （不传也可以，它会直接以屏幕的分辨率进行显示）
   - 如果有部分游戏的鼠标捕获功能异常，那么请将`--backend sdl`传入gamescope中
>~~小技巧：将`--cursor ./none`参数传入gamescope后游戏内的鼠标会显示为一个“X”，适合在无论如何鼠标图案都不正常的情况下使用（eg. Minecraft）~~ 这个问题我貌似已经通过`xdg.icons.fallbackCursorThemes`修好了

#### 使用说明
   **不建议直接clone下来复用** 
  建议选用部分代码到你的配置文件里，本配置文件依照程序功能进行了目录的划分，services文件夹中都是以其中配置的应用命名，如果需要参考某个软件的配置方法的话直接打开相应的文件就好。

  假如你非要直接克隆并使用的话，以下是步骤
  1. 首先先git clone下来并且cd到本仓库，然后再运行
    
    nixos-generate-config --root /mnt
    
    
  2. 将本仓库内的hardware-configuration.nix替换成刚刚生成的配置文件
    
    cp /mnt/etc/nixos/hardware-configuration.nix ./configuration/hardware-configuration.nix
    

  3. 然后再

    nixos-install --flake .#nixos --substituters https://mirror.sjtu.edu.cn/nix-channels/store
    
  > 注意：本配置文件中多次直接硬编码了我本人的用户名，并且配置了相应的用户 **和密码** ，非常不推荐直接复用
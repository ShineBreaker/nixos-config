### NixOS配置

#### 特点：

- 使用`Lix`来替代`Nix`以获得更快的build速度
- 使用`Sudo-RS`替换`Sudo`来获得更好的安全性
- 使用`Fish`作为Shell，使用`Limine`作为bootloader来提供Secure Boot支持
- 使用`linyaps`来提供国产软件支持
- 使用`FprintD`来提供指纹识别支持，目前系统登录、解锁、sudo提权均可以使用指纹识别进行
- 桌面环境为`Niri`，使用`sddm`作为Display Manager，桌面配套的设施为`Waybar`，`GtkLock`，`Fuzzel`，`Mako`，壁纸使用`Waypaper`进行管理，安装了`swww`和`mpvpaper`两个backend，文件管理器为`Nemo`，压缩包管理器为`File-Roller`，默认的输入法为`Fcitx5+Rime`，Rime默认使用`rime-ice`方案
- 默认使用`Papirus`图标包，`Bibata`鼠标指针。启用`qt5ct`, `qt6ct`以及`Kvantum`来实现对QT主题的支持
- 利用`Stylix`来管理系统主题
- 尽量将目录树的结构理得比较清晰，以方便自己以及他人理解

#### 注意事项：

- Niri中的帮助按钮为`Super+Alt+空格`（Super即为win键）
- gamescope中按照自己目前的设备配置了分辨率以及一些使用的参数，但是
  - 游戏的分辨率 **仍然需要作为参数传到gamescope中** （不传也可以，它会直接以屏幕的分辨率进行显示）
  - 如果有部分游戏的鼠标捕获功能异常，那么请将`--backend sdl`传入gamescope中

#### 小技巧：

- ~~将`--cursor ./none`参数传入gamescope后游戏内的鼠标会显示为一个“X”，适合在无论如何鼠标图案都不正常的情况下使用 (eg. `Minecraft`) ~~
  这个问题我貌似已经通过`xdg.icons.fallbackCursorThemes`修好了,但如果你还是遇到了一些无法无天的软件的话就可以用这招
- 对于一些缩放不正常的软件(eg. `WPS`), 可以通过在`labwc`中运行来解决问题

#### 实用命令行小工具

- `btop`: 方便的TUI任务管理器
- `nix-output-monitor`：可以监控nix-build时的软件包的程序，用法为`原本的nix代码 &| nom --json`
- `nh`(yet-another-nix-helper): 目前已经在rebuild时默认启用，是上述命令的包装

#### 配置结构

```
configuration/
├── 00-main/              # 主配置入口
│   ├── home.nix          # Home Manager 主配置
│   ├── services.nix      # 系统服务配置
│   └── system.nix        # 系统主配置
├── device/               # 设备特定配置
│   ├── hardware/         # 硬件配置
│   └── platform/         # 平台特定配置
├── home/                 # Home Manager 配置
│   ├── programs/         # 用户程序配置
│   ├── desktopEntries.nix # 桌面入口
│   ├── file.nix          # 文件配置
│   ├── programs.nix      # 程序导入
│   └── theme.nix         # 主题配置
├── services/             # 服务配置
└── system/               # 系统配置
    ├── boot.nix          # 引导配置
    ├── environment.nix   # 环境配置
    ├── fonts.nix         # 字体配置
    ├── hardware.nix      # 硬件配置
    ├── hardware-configuration.nix # 硬件自动生成配置
    ├── i18n.nix          # 国际化配置
    ├── security.nix      # 安全配置
    ├── services.nix      # 服务配置
    ├── swap.nix          # 交换配置
    ├── tpm2.nix          # TPM2 配置
    └── user.nix          # 用户配置
```

#### 使用说明

**不建议直接clone下来复用**
建议选用部分代码到你的配置文件里，本配置文件依照程序功能进行了目录的划分，services文件夹中都是以其中配置的应用命名，如果需要参考某个软件的配置方法的话直接打开相应的文件就好。

假如你非要直接克隆并使用的话，以下是步骤

1. 首先先git clone下来并且cd到本仓库，然后再运行

   nixos-generate-config --root /mnt

2. 将本仓库内的hardware-configuration.nix替换成刚刚生成的配置文件

   cp /mnt/etc/nixos/hardware-configuration.nix ./configuration/hardware-configuration.nix

3. 然后再

   nixos-install --flake .#BrokenShine-Desktop --substituters https://mirror.sjtu.edu.cn/nix-channels/store

> 注意：本配置文件中多次直接硬编码了我本人的用户名，并且配置了相应的用户 **和密码** ，非常不推荐直接复用

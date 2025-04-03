# NixOS配置

#### 介绍
个人的NixOS配置文件


#### 使用说明
不建议直接clone下来复用，建议选用部分代码并复制粘贴到你的配置文件里
假如你非要直接克隆并使用的话，以下是步骤

首先先git clone下来并且cd到本仓库
然后再运行

```
nixos-generate-config --root /mnt
```
将本仓库内的hardware-configuration.nix替换成刚刚生成的配置文件

```
cp /mnt/etc/nixos/hardware-configuration.nix ./configuration/hardware-configuration.nix
```

然后再

```
nixos-install --flake .#nixos --substituters https://mirror.sjtu.edu.cn/nix-channels/store
```
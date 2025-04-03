# NixOS配置

#### 介绍
个人的NixOS配置文件


#### 使用说明

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

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


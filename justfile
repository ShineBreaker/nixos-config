# 重新配置系统
rebuild:
  nh os switch . --ask

# 重新配置系统(开机后再启用)
rebuildb:
  nh os boot . --ask

# 重新配置系统(清除所有其他配置)
rebuildc:
  nh os switch .
  nh clean all
  nh os switch .

# 更新系统
upgrade:
  nix flake update
  git commit -a -m 'bump nixos version.'
  nh os boot . --ask

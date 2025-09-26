{
  ...
}:

{
  home.file.condarc = {
    enable = true;
    target = ".condarc";
    text = "
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/main
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/r
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.ustc.edu.cn/anaconda/cloud
  bioconda: https://mirrors.ustc.edu.cn/anaconda/cloud
    ";
  };

  xdg.configFile = {
    "fish/conf.d/conda.fish".source = ./dotfiles/config.fish;
  };
}

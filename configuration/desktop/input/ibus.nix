{ config, pkgs, lib, ... }:

{
  i18n.inputMethod = {
    type = "ibus";
    ibus.engines = with pkgs ; [
      ibus-engines.rime ibus-engines.mozc
    ];
  };
}

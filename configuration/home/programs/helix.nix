{
  pkgs,
  lib,
  ...
}:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkDefault "transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [
            "nixd"
            "nil"
          ];
        }
      ];
      language-server = {
        nixd.command = "${pkgs.nixd}/bin/nixd";
      };
    };
    themes = {
      transparent = {
        "inherits" = "ayu_mirage";
        "ui.background" = { };
        "ui.text" = { };
        "ui.help" = { };
        "ui.menu" = { };
        "ui.statusline" = { };
      };
    };
  };
}

{
  pkgs,
  lib,
  ...
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        ms-python.python
        ms-vscode.cpptools
        ms-toolsai.jupyter
        ms-pyright.pyright
        ms-vscode.cmake-tools
        ms-dotnettools.csharp
        ms-dotnettools.csdevkit
        ms-dotnettools.vscode-dotnet-runtime
        ms-vscode.makefile-tools
        ms-ceintl.vscode-language-pack-zh-hans

        bbenoist.nix
        brettm12345.nixfmt-vscode
        ecmel.vscode-html-css
        gencer.html-slim-scss-css-class-completion
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        stylelint.vscode-stylelint
        skyapps.fish-vscode
        shopify.ruby-lsp
        tamasfe.even-better-toml
        teabyii.ayu
        techtheawesome.rust-yew
        tekumara.typos-vscode
        xaver.clang-format
        yzhang.markdown-all-in-one
        yzhang.dictionary-completion
        zainchen.json
      ];

      userSettings = {
        "locale" = "zh-cn";
        "editor.fontFamily" = "'Maple Mono NF CN', 'monospace', monospace";
        "files.autoSave" = "onFocusChange";
        "editor.formatOnSave" = true;
        "editor.autoIndentOnPaste" = true;
        "terminal.integrated.defaultProfile.linux" = "fish (2)";
        "workbench.colorTheme" = "Ayu Mirage Bordered";
        "workbench.preferredDarkColorTheme" = "Ayu Mirage Bordered";
        "workbench.preferredLightColorTheme" = "Ayu Light Bordered";
        "workbench.iconTheme" = "vs-seti";
        "window.autoDetectColorScheme" = true;
        "C_Cpp.autocompleteAddParentheses" = true;
        "nixfmt.path" = lib.getExe pkgs.nixfmt-rfc-style;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.formatterPath" = lib.getExe pkgs.nixfmt-rfc-style;
        "nix.enableLanguageServer" = true;
        "terminal.integrated.inheritEnv" = false;
        "git.confirmSync" = false;
      };
    };
  };
}
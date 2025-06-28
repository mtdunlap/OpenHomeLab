{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./steam.nix
  ];

  nixpkgs = {
    config = {
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "discord"
          "steam"
          "steam-unwrapped"
          "vscode"
          "vscode-with-extensions"
          "ms-azuretools.vscode-containers"
          "ms-vscode-remote.remote-containers"
          "nvidia-x11"
          "nvidia-settings"
        ];
    };
  };
}

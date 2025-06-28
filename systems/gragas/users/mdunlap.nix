{
  config,
  pkgs,
  ...
}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      mdunlap = {
        isNormalUser = true;
        description = "Matthew Dunlap";
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
          "podman"
        ];
        packages = with pkgs; [
          podman-compose
          moonlight-qt
          librewolf
          chromium
          jellyfin-media-player
          discord
          (lutris.override {
            extraLibraries = pkgs: [
              # List library dependencies here
            ];
            extraPkgs = pkgs: [
              # List package dependencies here
            ];
          })
          nixfmt-rfc-style
          (vscode-with-extensions.override {
            vscodeExtensions =
              with vscode-extensions;
              [
                # List vscode extensions here
                jnoortheen.nix-ide
              ]
              ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                {
                  name = "vscode-containers";
                  publisher = "ms-azuretools";
                  version = "2.0.3";
                  sha256 = "0x5hx2j7qprpss0xi32jsjqcmc4jlwlm7xmydvc8i376spvq81rh";
                }
                {
                  name = "remote-containers";
                  publisher = "ms-vscode-remote";
                  version = "0.417.0";
                  sha256 = "1ls459a5n7l8s3cxks3zsmcxnr4dahprv2n5zn6hyhkkw3xafrwi";
                }
              ];
          })
        ];
      };
    };
  };
}
